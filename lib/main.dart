import 'package:flutter/material.dart';
import 'package:statepattern/home2/home2_state.dart';
import 'package:statepattern/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/home2': (context) => MyHome2()},
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //@override
  // void initState() {
  //   super.initState();
  //   store.addListener(() {
  //     setState(() {});
  //   });
  // }

  final store = Store();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: store,
        builder: (context, child) {
          final state = store.state;
          Widget body = Container();
          if (state.isLoading) {
            body = const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.error.isNotEmpty || state.pokemons.isEmpty) {
            body = Center(
              child: ElevatedButton(
                onPressed: store.getPokemons,
                child: Text(state.error.isNotEmpty
                    ? state.error
                    : 'Click para pegar Pokemon'),
              ),
            );
          } else if (state.pokemons.isNotEmpty) {
            body = ListView.builder(
                shrinkWrap: true,
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) {
                  return Text(state.pokemons[index].name);
                });
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: body,

            // Center(
            //   child: Expanded(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         body,
            //         // const Text(
            //         //   'You have pushed the button this many times:',
            //         // ),
            //         // Text(
            //         //   '$_counter',
            //         //   style: Theme.of(context).textTheme.headlineMedium,
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.of(context).pushNamed('/home2'),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }
}
