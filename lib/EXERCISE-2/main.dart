import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_counters.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("MyApp build");
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("HomePage build");
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Color Taps' : 'Statistics'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.tap_and_play), label: 'Taps'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Statistics'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _selectedIndex == 0 ? const TapsPage() : const StatisticsPage(),
      ),
    );
  }
}

class TapsPage extends StatelessWidget {
  const TapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("TapPage build");
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<ColorCounters>(context, listen: false)
                .incrementCounter1();
          },
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Consumer<ColorCounters>(
                builder: (context, colorCounters, child) {
                  // ignore: avoid_print
                  print("colorCounter1 build");
                  return Text(
                    'Taps: ${colorCounters.counter1}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Provider.of<ColorCounters>(context, listen: false)
                .incrementCounter2();
          },
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Consumer<ColorCounters>(
                builder: (context, colorCounters, child) {
                  // ignore: avoid_print
                  print("colorCounter2 build");
                  return Text(
                    'Taps: ${colorCounters.counter2}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("StatisticsPage build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<ColorCounters>(
          builder: (context, colorCounters, child) {
            // ignore: avoid_print
            print("RedTap build");
            return Text(
              'Red Taps: ${colorCounters.counter1}',
              style: const TextStyle(
                color: Colors.black,
              ),
            );
          },
        ),
        Consumer<ColorCounters>(
          builder: (context, colorCounters, child) {
            // ignore: avoid_print
            print("BlueTap build");
            return Text(
              'Blue Taps: ${colorCounters.counter2}',
              style: const TextStyle(
                color: Colors.black,
              ),
            );
          },
        ),
      ],
    );
  }
}
