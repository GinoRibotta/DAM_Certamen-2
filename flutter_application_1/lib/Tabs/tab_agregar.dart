import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../provider/medicamentos_provider.dart';

class TabAgregar extends StatefulWidget {
  TabAgregar({Key? key}) : super(key: key);

  @override
  State<TabAgregar> createState() => _TabAgregarState();
}

class _TabAgregarState extends State<TabAgregar> {
  TextEditingController vin = new TextEditingController();
  TextEditingController marca = new TextEditingController();
  TextEditingController modelo = new TextEditingController();
  TextEditingController ano = new TextEditingController();
  TextEditingController precio = new TextEditingController();
  String errVin = '';
  String errMarca = '';
  String errModelo = '';
  String errAno = '';
  String errPrecio = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Auto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: vin,
                decoration: InputDecoration(
                    labelText: 'Vin', hintText: 'Escriba el vin'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errVin,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              child: TextField(
                controller: marca,
                decoration: InputDecoration(
                    labelText: 'Marca', hintText: 'Escriba la marca'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errMarca,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              child: TextField(
                controller: modelo,
                decoration: InputDecoration(
                    labelText: 'Modelo', hintText: 'Escriba el modelo'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errModelo,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              child: TextField(
                controller: ano,
                decoration: InputDecoration(
                    labelText: 'Año', hintText: 'Escriba el Año del auto'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errAno,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              child: TextField(
                controller: precio,
                decoration: InputDecoration(
                    labelText: 'Precio',
                    hintText: 'Escriba el Precio del auto'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errPrecio,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.all(10),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                child: Text('Agregar Auto'),
                onPressed: () => addAuto(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addAuto() async {
    MedicamentosProvider provider = new MedicamentosProvider();
    var data = await provider.addAuto(vin.value.text, marca.value.text,
        modelo.value.text, int.parse(ano.text), int.parse(precio.value.text));

    if (data == null) {
      Navigator.pop(context);
    } else {
      setState(() {
        if (data['errors']['vin'] == null) {
          errVin = '';
        } else {
          errVin = data['errors']['vin'][0];
        }
        if (data['errors']['marca'] == null) {
          errMarca = '';
        } else {
          errMarca = data['errors']['marca'][0];
        }
        if (data['errors']['modelo'] == null) {
          errModelo = '';
        } else {
          errModelo = data['errors']['modelo'][0];
        }
        if (data['errors']['año'] == null) {
          errAno = '';
        } else {
          errAno = data['errors']['año'][0];
        }
        if (data['errors']['precio'] == null) {
          errPrecio = '';
        } else {
          errPrecio = data['errors']['precio'][0];
        }
      });
    }
  }
}
