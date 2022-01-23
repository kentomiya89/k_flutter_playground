import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavBarIndexProvider = StateProvider.autoDispose<int>((_) => 0);

enum TabItem {
  test1,
  test2,
  test3,
}

const tabTitle = <TabItem, String>{
  TabItem.test1: 'テスト1',
  TabItem.test2: 'テスト2',
  TabItem.test3: 'テスト3',
};

const tabIcon = <TabItem, Icon>{
  TabItem.test1: Icon(Icons.add),
  TabItem.test2: Icon(Icons.sanitizer),
  TabItem.test3: Icon(Icons.clear),
};

// const tabScreen = <TabItem, StatelessWidget>{
//   TabItem.test1: Test1(),
//   TabItem.test2: Test2(),
//   TabItem.test3: Test3(),
// };

// Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
//   TabItem.test1: GlobalKey<NavigatorState>(),
//   TabItem.test2: GlobalKey<NavigatorState>(),
//   TabItem.test3: GlobalKey<NavigatorState>(),
// };

const tabScreen = [
  Test1(),
  Test2(),
  Test3(),
];
final navigatorKeys = [
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>()
];

class BottomNavigationRemain extends HookConsumerWidget {
  const BottomNavigationRemain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarIndexProvider);
    final bottomController = ref.watch(bottomNavBarIndexProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('サンプル'),
      ),
      body: TabNavigator(
        navigationKey: navigatorKeys[currentIndex],
        route: buildRoute(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'テスト1'),
          BottomNavigationBarItem(icon: Icon(Icons.sanitizer), label: 'テスト2'),
          BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'テスト3'),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          bottomController.state = index;
        },
      ),
    );
  }

  Route buildRoute(int index) {
    switch (index) {
      case 0:
        return Test1.route();
      case 1:
        return Test2.route();
      case 2:
        return Test3.route();
      default:
        return Test1.route();
    }
  }
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({required this.navigationKey, required this.route});

  final GlobalKey<NavigatorState> navigationKey;
  final Route route;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigationKey,
      onGenerateRoute: (_) {
        return route;
      },
    );
  }
}

class Test1 extends StatelessWidget {
  const Test1();

  static Route<dynamic> route() => MaterialPageRoute(builder: (_) => Test1());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(Test4.route());
        },
        child: Text('Test4へ遷移'),
      ),
    );
  }
}

class Test2 extends StatelessWidget {
  const Test2();

  static Route<dynamic> route() => MaterialPageRoute(builder: (_) => Test2());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class Test3 extends StatelessWidget {
  const Test3();

  static Route<dynamic> route() => MaterialPageRoute(builder: (_) => Test3());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class Test4 extends StatelessWidget {
  const Test4();

  static Route<dynamic> route() => MaterialPageRoute(builder: (_) => Test4());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
