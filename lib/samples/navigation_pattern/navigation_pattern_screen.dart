import 'package:flutter/material.dart';

final buttonText = '画面遷移';

class NavigationPatternScreen extends StatelessWidget {
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
                child: Text('NamedRouteのやり方'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MaterialPageRouteScreen();
                      },
                    ),
                  );
                },
                child: Text('MaterialPageRouteのやり方'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(StaticRouteDefineScreen.route());
                },
                child: Text('MaterialPageRouteのやり方'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NamedRouteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('遷移先'),
      ),
      body: Center(
        child: Text('NamedRouteでの遷移先'),
      ),
    );
  }
}

class MaterialPageRouteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('遷移先'),
      ),
      body: Center(
        child: Text('MaterialPageRouteでの遷移先'),
      ),
    );
  }
}

class StaticRouteDefineScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => StaticRouteDefineScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('遷移先'),
      ),
      body: Center(
        child: Text('StaticRouteScreenでの遷移先'),
      ),
    );
  }
}
