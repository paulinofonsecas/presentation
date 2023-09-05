// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:presentation/app/models/programador.dart';

abstract class IProgrammadorService {
  Future<Programador?> getProgramador(int id);
  Future<Programador?> addProgramador(Programador programador);
  Future<Programador?> updateProgramador(Programador programador);
  Future<Programador?> deleteProgramador(int id);
  Future<List<Programador>?> getProgramadores();
}

class ProgramadorService implements IProgrammadorService {
  final Dio dio;

  ProgramadorService(this.dio);

  @override
  Future<List<Programador>?> getProgramadores() async {
    try {
      Response<List<dynamic>> response = await dio.get('/programador');
      if (response.statusCode == 200) {
        var programadores = response.data
            ?.map(
              (e) => Programador.fromMap(e),
            )
            .toList();

        return programadores;
      } else {
        return null;
      }
    } on DioException {
      return null;
    }
  }

  @override
  Future<Programador?> getProgramador(int id) async {
    try {
      Response<dynamic> response = await dio.get('/programador/$id');
      if (response.statusCode == 200) {
        var programador = Programador.fromMap(response.data);
        return programador;
      } else {
        return null;
      }
    } on DioException {
      return null;
    }
  }

  @override
  Future<Programador?> addProgramador(Programador programador) async {
    try {
      Response<dynamic> response = await dio.post(
        '/programador',
        data: {
          'nome': programador.nome,
          'especialidade': programador.especialidade,
        },
      );

      if (response.statusCode == 201) {
        var programador = Programador.fromMap(response.data);

        return programador;
      } else {
        return null;
      }
    } on DioException {
      return null;
    }
  }

  @override
  Future<Programador?> updateProgramador(Programador programador) async {
    try {
      Response<dynamic> response = await dio.put(
        '/programador/${programador.id}',
        data: {
          'nome': programador.nome,
          'especialidade': programador.especialidade,
        },
      );

      if (response.statusCode == 200) {
        var programador = Programador.fromMap(response.data);

        return programador;
      } else {
        return null;
      }
    } on DioException {
      return null;
    }
  }

  @override
  Future<Programador?> deleteProgramador(int id) async {
    try {
      Response<dynamic> response = await dio.delete('/programador/$id');

      if (response.statusCode == 200) {
        var programador = Programador.fromMap(response.data);

        return programador;
      } else {
        return null;
      }
    } on DioException {
      return null;
    }
  }
}
