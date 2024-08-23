import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _gasolinaController = TextEditingController();
  final TextEditingController _alcoolController = TextEditingController();
  final loading = ValueNotifier<bool>(false);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _resultado = "Informe seus dados!";

  void _limparCampos() {
    _gasolinaController.text = "";
    _alcoolController.text = "";
    setState(() {
      _resultado = "Informe os dados!";
    });
  }

  void _calcular() async {
    loading.value = !loading.value;
    await Future.delayed(const Duration(seconds: 2));
    double gasolina = double.tryParse(_gasolinaController.text) ?? 0.0;
    double alcool = double.tryParse(_alcoolController.text) ?? 0.0;
    double razao = alcool / gasolina;
    loading.value = !loading.value;

    setState(() {
      if (razao < 0.7) {
        _resultado = "Abasteça com Álcool";
      } else {
        _resultado = "Abasteça com Gasolina";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Combustível"),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        actions: <Widget>[
          IconButton(onPressed: _limparCampos, icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.local_gas_station, size: 120, color: Colors.blue[400]),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Gasolina",
                  labelStyle: TextStyle(color: Colors.blue[400]),
                ),
                style: TextStyle(color: Colors.blue[400]),
                controller: _gasolinaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe o valor da Gasolina";
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Álcool",
                  labelStyle: TextStyle(color: Colors.blue[400]),
                ),
                style: TextStyle(color: Colors.blue[400]),
                controller: _alcoolController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe o valor do Álcool";
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calcular();
                      }
                    },
                    child: AnimatedBuilder(
                        animation: loading,
                        builder: (context, _) {
                          return loading.value
                              ? const SizedBox(
                                  width: 21,
                                  height: 20,
                                  child: CircularProgressIndicator(),
                                )
                              : const Text("Calcular");
                        }),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                    ),
                  ),
                ),
              ),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
