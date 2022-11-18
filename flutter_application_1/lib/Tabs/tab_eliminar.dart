import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../provider/medicamentos_provider.dart';

class TabEliminar extends StatefulWidget {
  TabEliminar({Key? key}) : super(key: key);

  @override
  State<TabEliminar> createState() => _TabEliminarState();
}

class _TabEliminarState extends State<TabEliminar> {
  final formKey = GlobalKey<FormState>();
  MedicamentosProvider provider = new MedicamentosProvider();
  TextEditingController vin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView(
                children: [
                  TextFormField(
                    controller: vin,
                    decoration: InputDecoration(
                        labelText: 'Vin', hintText: 'Escriba el Vin del auto'),
                  ),
                ],
              ),
            )),
            Spacer(),
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.all(10),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                child: Text('Eliminar Auto'),
                onPressed: () => {
                  provider.borrarAuto(vin.text.toString().trim()),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
