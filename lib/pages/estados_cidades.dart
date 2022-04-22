// import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class EstadosCidades extends StatefulWidget {
  const EstadosCidades({Key? key}) : super(key: key);

  @override
  _EstadosCidadesState createState() => _EstadosCidadesState();
}

class _EstadosCidadesState extends State<EstadosCidades> {
  final _formKey = GlobalKey<FormState>();
  bool _liberaCidade = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Estados / Cidades")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(4),
            children: <Widget>[
              DropdownSearch<Estado>(
                items: [
                  Estado(id: '43', sigla: 'RS', nome: 'Rio Grande do Sul'),
                  Estado(id: '50', sigla: 'MS', nome: 'Mato Grosso do Sul'),
                  Estado(id: '51', sigla: 'MT', nome: 'Mato Grosso'),
                  Estado(id: '52', sigla: 'GO', nome: 'Goiás'),
                  Estado(id: '53', sigla: 'DF', nome: 'Distrito Federal'),
                  Estado(id: '11', sigla: 'RO', nome: 'Rondônia'),
                  Estado(id: '12', sigla: 'AC', nome: 'Acre'),
                  Estado(id: '13', sigla: 'AM', nome: 'Amazonas'),
                  Estado(id: '14', sigla: 'RR', nome: 'Roraima'),
                  Estado(id: '15', sigla: 'PA', nome: 'Pará'),
                  Estado(id: '16', sigla: 'AP', nome: 'Amapá'),
                  Estado(id: '17', sigla: 'TO', nome: 'Tocantins'),
                  Estado(id: '21', sigla: 'MA', nome: 'Maranhão'),
                  Estado(id: '22', sigla: 'PI', nome: 'Piauí'),
                  Estado(id: '23', sigla: 'CE', nome: 'Ceará'),
                ],
                maxHeight: 300,
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Escolha o estado",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                // onFind: (String? filter) => getEstados(filter),
                onChanged: (Object? object) {
                  setState(() {
                    _liberaCidade = !_liberaCidade;
                  });
                },
                showSearchBox: true,
              ),
              Divider(),
              DropdownSearch<Estado>(
                enabled: _liberaCidade,
                items: [
                  Estado(id: '43', sigla: 'RS', nome: 'Rio Grande do Sul'),
                  Estado(id: '50', sigla: 'MS', nome: 'Mato Grosso do Sul'),
                  Estado(id: '51', sigla: 'MT', nome: 'Mato Grosso'),
                  Estado(id: '52', sigla: 'GO', nome: 'Goiás'),
                  Estado(id: '53', sigla: 'DF', nome: 'Distrito Federal'),
                  Estado(id: '11', sigla: 'RO', nome: 'Rondônia'),
                  Estado(id: '12', sigla: 'AC', nome: 'Acre'),
                  Estado(id: '13', sigla: 'AM', nome: 'Amazonas'),
                  Estado(id: '14', sigla: 'RR', nome: 'Roraima'),
                  Estado(id: '15', sigla: 'PA', nome: 'Pará'),
                  Estado(id: '16', sigla: 'AP', nome: 'Amapá'),
                  Estado(id: '17', sigla: 'TO', nome: 'Tocantins'),
                  Estado(id: '21', sigla: 'MA', nome: 'Maranhão'),
                  Estado(id: '22', sigla: 'PI', nome: 'Piauí'),
                  Estado(id: '23', sigla: 'CE', nome: 'Ceará'),
                ],
                maxHeight: 300,
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Escolha a Cidade",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                // onFind: (String? filter) => getEstados(filter),
                onChanged: print,
                showSearchBox: true,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  // Future<List<Estado>> getEstados(filter) async {
  //   List<Estado> data = [];
  //   Future.delayed(Duration(seconds: 1), () {
  //     data = [
  //       Estado(id: '43', sigla: 'RS', nome: 'Rio Grande do Sul'),
  //       Estado(id: '50', sigla: 'MS', nome: 'Mato Grosso do Sul'),
  //       Estado(id: '51', sigla: 'MT', nome: 'Mato Grosso'),
  //     ];
  //   });

  //   return Estado.fromJsonListEstados(data);
  // }
}

class Estado {
  final String? id;
  final String? sigla;
  final String? nome;

  Estado({this.id, this.sigla, this.nome});

  factory Estado.fromJson(Map<String, dynamic> json) {
    return Estado(
      id: json["id"],
      sigla: json["sigla"],
      nome: json["nome"],
    );
  }

  static List<Estado> fromJsonListEstados(List list) {
    return list.map((item) => Estado.fromJson(item)).toList();
  }

  @override
  String toString() => nome!;
}
