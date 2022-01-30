import 'package:flutter/material.dart';

class NavigationPatternScreen extends StatelessWidget {
  const NavigationPatternScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サンプル集'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/namedRoute');
                },
                child: const Text('NamedRouteのやり方'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push<MaterialPageRoute<MaterialPageRouteScreen>>(
                    MaterialPageRoute(
                      builder: (context) => const MaterialPageRouteScreen(),
                    ),
                  );
                },
                child: const Text('MaterialPageRouteのやり方'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    StaticRouteDefineScreen.route(),
                  );
                },
                child: const Text('MaterialPageRouteのやり方'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NamedRouteScreen extends StatelessWidget {
  const NamedRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('遷移先'),
      ),
      body: const Center(
        child: Text('NamedRouteでの遷移先'),
      ),
    );
  }
}

class MaterialPageRouteScreen extends StatelessWidget {
  const MaterialPageRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('遷移先'),
      ),
      body: const Center(
        child: Text('MaterialPageRouteでの遷移先'),
      ),
    );
  }
}

class StaticRouteDefineScreen extends StatelessWidget {
  const StaticRouteDefineScreen({Key? key}) : super(key: key);

  static Route<MaterialPageRoute<void>> route() =>
      MaterialPageRoute(builder: (_) => const StaticRouteDefineScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('遷移先'),
      ),
      body: const Center(
        child: Text('StaticRouteScreenでの遷移先'),
      ),
    );
  }
}
