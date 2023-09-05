// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:presentation/app/controllers/home_page_controller.dart';
import 'package:presentation/app/models/programador.dart';

import 'list_item.dart';

class ListProgramadores extends StatefulWidget {
  const ListProgramadores({
    super.key,
    required this.controller,
  });

  final HomePageController controller;

  @override
  State<ListProgramadores> createState() => _ListProgramadoresState();
}

class _ListProgramadoresState extends State<ListProgramadores> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Programador>?>(
        future: widget.controller.getProgramadores(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var programadores = snapshot.data ?? [];

          if (programadores.isEmpty) {
            return const Center(
              child: Text('Nenhum programador cadastrado'),
            );
          }

          return ListView.builder(
            itemCount: programadores.length,
            itemBuilder: (_, index) {
              var item = programadores[index];

              return ListItem(
                item: item,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return showMyDialog(context, item);
                    },
                  ).then((value) {
                    if (value is bool && value == true) setState(() {});
                  });
                },
                onTrailingTap: () async {
                  await widget.controller.deleteProgramador(item.id).then(
                    (value) {
                      setState(() {});
                    },
                  );
                },
              );
            },
          );
        });
  }

  Widget showMyDialog(BuildContext context, Programador item) {
    return AlertDialog(
      title: Text('Informações do programador'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nome',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Text(
            item.nome,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Especialidade',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Text(
            item.especialidade,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          TextButton.icon(
            onPressed: () {
              widget.controller.deleteProgramador(item.id);
              Navigator.of(context).pop(true);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            icon: Icon(Icons.delete),
            label: Text('Deletar'),
          ),
        ],
      ),
    );
  }
}
