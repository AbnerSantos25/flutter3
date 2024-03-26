import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Soma:'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _y = 0;
  final TextEditingController _controlaSoma = TextEditingController();
  Icon certo = const Icon(Icons.check);
  Icon errado = const Icon(Icons.close);
  Icon saida = const Icon(Icons.question_mark);
  Map _respostas = {};

  @override
  void initState() {
    super.initState();
    _y = Random().nextInt(10);
  }

  void corrigir() {
    int soma = 1 + _y;
    String digitado = _controlaSoma.text;
    int resultado = int.parse(digitado);

    setState(() {
      if (soma == resultado) {
        final contem = _respostas.containsKey({'1+$_y': certo});
        if (contem == false) {
          _respostas.addAll({'1+$_y': certo});
        } else {}
      } else {
        final contem = _respostas.containsKey({'1+$_y': errado});
        if (contem == false) {
          _respostas.addAll({'1+$_y': errado});
        } else {}
      }
      _y = Random().nextInt(10); //validar aquuiiiii
      _controlaSoma.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text('1 + $_y = '),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _controlaSoma,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: corrigir,
              child: const Text("Corrigir"),
            ),
            SizedBox(
              width: 32,
              height: 32,
              child: saida,
            ),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  celula("0"),
                  celula("1"),
                  celula("2"),
                  celula("3"),
                  celula("4"),
                  celula("5"),
                  celula("6"),
                  celula("7"),
                  celula("8"),
                  celula("9"),
                ]),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  TableCell celula(String i) {
    return TableCell(
      child: SizedBox(
        width: 32,
        height: 32,
        child: _respostas['1+$i'],
      ),
    );
  }
}
