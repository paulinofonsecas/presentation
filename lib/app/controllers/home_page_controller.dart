import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/app/models/programador.dart';
import 'package:presentation/app/services/programador_service.dart';

class HomePageController {
  late final IProgrammadorService _programmadorService;
  late final TextEditingController nomeController;
  late final TextEditingController especialidadeController;

  HomePageController() {
    var dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000/api'));
    _programmadorService = ProgramadorService(dio);

    nomeController = TextEditingController();
    especialidadeController = TextEditingController();
  }

  Future<List<Programador>?> getProgramadores() async {
    return await _programmadorService.getProgramadores();
  }

  Future<Programador?> getProgramador(int id) async {
    return await _programmadorService.getProgramador(id);
  }

  Future<Programador?> _addProgramador(Programador programador) async {
    return await _programmadorService.addProgramador(programador);
  }

  Future<Programador?> updateProgramador(Programador programador) async {
    return await _programmadorService.updateProgramador(programador);
  }

  Future<Programador?> deleteProgramador(int id) async {
    return await _programmadorService.deleteProgramador(id);
  }

  Future<void> saveProgramador() async {
    var programador = Programador.make(
      nome: nomeController.text,
      especialidade: especialidadeController.text,
    );

    _addProgramador(programador);
  }
}
