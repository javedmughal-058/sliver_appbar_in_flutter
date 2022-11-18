import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 160.0,
              title: const Text('Welcome', style: TextStyle(fontSize: 16, color: Colors.grey),),
              actions: [
                IconButton(
                  
                    onPressed: (){}, icon: const Icon(Icons.settings))
              ],
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Muhammad Javed'),
                expandedTitleScale: 1.6,
                // background: FlutterLogo(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: Text('Scroll down to see the SliverAppBar functionality.'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              overflowAlignment: OverflowBarAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('pinned'),
                    Switch(
                      onChanged: (bool val) {
                        setState(() {
                          _pinned = val;
                        });
                      },
                      value: _pinned,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('snap'),
                    Switch(
                      onChanged: (bool val) {
                        setState(() {
                          _snap = val;
                          // Snapping only applies when the app bar is floating.
                          _floating = _floating || _snap;
                        });
                      },
                      value: _snap,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('floating'),
                    Switch(
                      onChanged: (bool val) {
                        setState(() {
                          _floating = val;
                          _snap = _snap && _floating;
                        });
                      },
                      value: _floating,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


