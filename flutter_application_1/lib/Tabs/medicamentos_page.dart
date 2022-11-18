import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/medicamentos_provider.dart';

class MedicamentosPage extends StatefulWidget {
  //const MedicamentosPage({super.key});

  @override
  State<MedicamentosPage> createState() => _MedicamentosPageState();
}

class _MedicamentosPageState extends State<MedicamentosPage> {
  var fPrecio =
      NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Autos'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: MedicamentosProvider().getMedicamentos(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var medicamento = snapshot.data[index];
                  return ListTile(
                    leading: Icon(MdiIcons.car),
                    title: Text(snapshot.data[index]['marca']),
                    subtitle: Text(medicamento['model'] +
                        " Año " +
                        '${snapshot.data[index]['año']}'),
                    trailing: Chip(
                      label:
                          Text('\$ ${fPrecio.format(medicamento['precio'])}'),
                    ),
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
