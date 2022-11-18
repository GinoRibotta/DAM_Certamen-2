import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../bottom_nav_tab.dart';
import 'tab_agregar.dart';

class TabFormulario extends StatefulWidget {
  TabFormulario({Key? key}) : super(key: key);

  @override
  State<TabFormulario> createState() => _TabFormularioState();
}

class _TabFormularioState extends State<TabFormulario> {
  final formKey = GlobalKey<FormState>();
  DateTime fechaSeleccionada = DateTime.now();
  var fFecha = DateFormat('dd-MM-yyyy');
  final emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Productos'),
        elevation: 0,
      ),
      body: Form(
        key: formKey, //la llave del formulario para validación de los campos...
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Text(
              'Ingrese Datos del Producto',
              style:
                  TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView(children: [
              campoNombreProducto(),
              campoPrecioCompra(),
              campoCantidad(),
              campoPrecioVenta(),
              SizedBox(
                height: 20,
              ),
              campoFechaIngreso(),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _navegarTo(context, 'volver');
                  }
                },
                child: const Text('Enviar Datos'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 129, 31, 28),
                  onPrimary: Colors.white,
                  fixedSize: const Size(500, 35),
                ),
              ),
            ]),
          )),
        ]),
      ),
    );
  }

  TextFormField campoNombreProducto() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nombre del Producto',
      ),
      validator: (nombres) {
        if (nombres!.isEmpty) {
          return 'Indique Nombre';
        }
        return null;
      },
    );
  }

  TextFormField campoPrecioCompra() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Precio Compra Neto'),
      validator: (preciocompra) {
        if (preciocompra!.isEmpty) {
          return 'Indique Precio Neto de Compra';
        }
        return null;
      },
    );
  }

  TextFormField campoCantidad() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Cantidad de Unidades',
      ),
      validator: (cantidad) {
        if (cantidad!.isEmpty) {
          return 'Indique Cantidad';
        }
        return null;
      },
    );
  }

  TextFormField campoPrecioVenta() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Precio de Venta',
      ),
      validator: (venta) {
        if (venta!.isEmpty) {
          return 'Indique Precio Venta';
        }
        return null;
      },
    );
  }

  Widget campoFechaIngreso() {
    return Row(
      children: [
        Text('Fecha de Ingreso: '),
        //Text('01-01-0001'),
        Text(fFecha.format(fechaSeleccionada)),
        Spacer(),
        TextButton(
          child: Icon(Icons.calendar_today),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              locale: Locale('es', 'ES'),
            ).then((fecha) {
              setState(() {
                fechaSeleccionada = fecha == null ? fechaSeleccionada : fecha;
              });
            });
          },
        )
      ],
    );
  }

  void _navegarTo(BuildContext context, String screen) {
    final route = MaterialPageRoute(builder: (context) {
      return BottomNav();
    });
    Navigator.push(context, route);
  }
}
