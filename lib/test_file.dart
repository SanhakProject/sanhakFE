import 'package:flutter/material.dart';
import 'package:sanhak/components/permissions/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:noise_meter/noise_meter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestMicPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _startListening() async {
    final speech = SpeechToText();
    bool available = await speech.initialize();
    if (available) {
      await speech.listen(onResult: (result) {
        print("인식된 텍스트: ${result.recognizedWords}");
      });
    } else {
      print("음성 인식 초기화 실패");
    }
  }

  void _startNoiseMeter() async {
    NoiseMeter().noise.listen(
          (NoiseReading noiseReading) {
        print('Noise: ${noiseReading.meanDecibel} dB');
        print('Max amp: ${noiseReading.maxDecibel} dB');
      },
      onError: (Object error) {
        print(error);
      },
      cancelOnError: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _startListening,
              child: Text("음성 인식 시작"),
            ),
            ElevatedButton(
              onPressed: _startNoiseMeter,
              child: Text("소리 감지 시작"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
