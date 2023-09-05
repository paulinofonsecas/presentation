// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:presentation/app/controllers/home_page_controller.dart';

class CreateProgramador extends StatefulWidget {
  const CreateProgramador({super.key});

  @override
  State<CreateProgramador> createState() => _CreateProgramadorState();
}

class _CreateProgramadorState extends State<CreateProgramador> {
  late final HomePageController _controller;

  @override
  void initState() {
    _controller = HomePageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Programador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller.nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                hintText: 'Nome do Programador',
              ),
            ),
            SizedBox(height: 16 / 2),
            TextField(
              controller: _controller.especialidadeController,
              decoration: const InputDecoration(
                labelText: 'Especialidade',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.work),
                hintText: 'Especialidade do Programador',
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                _controller.saveProgramador().then((value) {
                  Navigator.of(context).pop();
                });
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
