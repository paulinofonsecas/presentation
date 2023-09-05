// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:presentation/app/pages/create/create_page.dart';
import 'package:presentation/app/controllers/home_page_controller.dart';

import 'components/list_programadores.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageController homePageController;

  @override
  void initState() {
    homePageController = HomePageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feliz dia do programador'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
          Padding(padding: EdgeInsets.all(8)),
        ],
      ),
      body: ListProgramadores(
        controller: homePageController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(builder: (_) => const CreateProgramador()),
          )
              .then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
