import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:k_flutter_playground/graphql/kanto_pokemon.data.gql.dart';
import 'package:k_flutter_playground/graphql/kanto_pokemon.req.gql.dart';
import 'package:k_flutter_playground/util/logger.dart';

final clientProvider = Provider(
  (_) => Client(
    link: HttpLink('https://graphql-pokemon2.vercel.app/'),
  ),
);

final pokemonFetchProvider = StreamProvider.autoDispose(
  (ref) => ref.watch(clientProvider).request(
        GKantoPokemonReq(
          (b) => b
            ..fetchPolicy = FetchPolicy.CacheFirst
            ..requestId = 'KantoPokemon',
        ),
      ),
);

class PokemonScreen extends HookWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = useProvider(pokemonFetchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('関東のポケモン'),
        actions: [
          IconButton(
            onPressed: () => context.refresh(pokemonFetchProvider),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: result.maybeWhen(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        orElse: () {
          final pokemonData = result.data?.value.data;

          logger..info('データソースタイプ')..info(result.data?.value.dataSource);

          // エラー時はデータがない
          if (pokemonData == null) {
            return Center(
              child: TextButton(
                onPressed: () {
                  context.refresh(pokemonFetchProvider);
                },
                child: Text('再取得する', style: TextStyle(fontSize: 20)),
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: pokemonData.pokemons!.length,
            itemBuilder: (context, index) => _PokemonCard(
              pokemon: pokemonData.pokemons![index],
            ),
          );
        },
      ),
    );
  }
}

class _PokemonCard extends StatelessWidget {
  const _PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final GKantoPokemonData_pokemons pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          pokemon.image!,
          height: 120,
        ),
        title: Text(pokemon.name!),
        subtitle: Text(pokemon.number!),
      ),
    );
  }
}
