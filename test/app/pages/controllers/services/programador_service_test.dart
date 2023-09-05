import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/app/models/programador.dart';
import 'package:presentation/app/services/programador_service.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('Exemplo de teste usando o mock Dio', () {
    var dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000/api'));
    IProgrammadorService httpService = ProgramadorService(dio);

    test('Get all programmers', () async {
      var programadores = await httpService.getProgramadores();

      expect(programadores, isA<List<Programador>>());
    });

    test('Get programmer', () async {
      var programador = await httpService.getProgramador(1);

      expect(programador, isA<Programador>());
    });

    test('Edit programmer', () async {
      var p = await httpService.getProgramador(14);
      var f = Programador(p!.id, 'bag', p.especialidade);
      var programador = await httpService.updateProgramador(f);

      expect(programador?.nome, 'bag');
    });

    test('Create programmer', () async {
      var programador = Programador(0, 'Arroz', 'Branco');

      var result = await httpService.addProgramador(programador);

      expect(result, isA<Programador>());
      expect(result?.nome, 'Arroz');
    });

    test('Delete programmer', () async {
      await httpService.deleteProgramador(13);
      var p = await httpService.getProgramador(13);
      expect(p, isNull);
    });
  });
}
