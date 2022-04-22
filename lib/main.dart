import 'package:app1/pages/estados_cidades.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'App 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cpfController = TextEditingController();
  static const platformChannel =
      MethodChannel('flutter.methodchannel/iOS/recupera.cpf');

  @override
  void dispose() {
    cpfController.dispose();
    super.dispose();
  }

  void _incrementCounter() async {
    try {
      final String result = await platformChannel.invokeMethod(
          'getDeviceModel', cpfController.text);

      print('Result: $result');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: cpfController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Informe o CPF',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EstadosCidades(),
                    ),
                  );
                },
                child: const Text('IR'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.send),
      ),
    );
  }
}
