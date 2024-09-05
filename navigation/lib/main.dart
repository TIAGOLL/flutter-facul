import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:navegation/telaSec.dart'; // Certifique-se de que esses arquivos existem e estão corretos.
import 'package:navegation/telaTer.dart';
import 'package:navegation/telaQua.dart';
import 'package:navegation/telaQui.dart'; // Certifique-se de que o arquivo `take_picture_screen.dart` está correto
import 'package:navegation/telaSex.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtenha a lista de câmeras disponíveis
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaPrincipal(camera: camera),
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  final CameraDescription camera;

  const TelaPrincipal({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatSelectionWidet(),
                  ),
                );
              },
              child: Text("Ir para segunda tela"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NeoDigitalScreen(),
                  ),
                );
              },
              child: Text("Ir para terceira tela"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomWaveShape(),
                  ),
                );
              },
              child: Text("Ir para quarta tela"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TakePictureScreen(camera: camera),
                  ),
                );
              },
              child: Text("Ir para tela de captura"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomLikeButton(),
                  ),
                );
              },
              child: Text("Ir para tela do coração"),
            ),
          ],
        ),
      ),
    );
  }
}
