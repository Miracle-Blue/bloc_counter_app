import 'package:bloc_lesson_1/domain/cubit/id_cubit.dart';
import 'package:bloc_lesson_1/domain/cubit/internet_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ID Cubit', () {
    IdCubit idCubit = IdCubit();

    tearDown(() {
      idCubit.close();
    });

    test('The initial state for the IdCubit is 0', () {
      expect(idCubit.state, const IdState(counter: 0));
    });

    blocTest(
      'The cubit should emit a IdState(counter: 1, wasIncremented: true) when cubit.increment() function is called',
      build: () => idCubit,
      act: (IdCubit cubit) => cubit.increment(),
      expect: () => [const IdState(counter: 1, wasIncremented: true)],
    );

    blocTest(
      'The cubit should emit a IdState(counter: -1, wasIncremented: false) when cubit.decrement() function is called',
      build: () => idCubit,
      act: (IdCubit cubit) => cubit.decrement(),
      expect: () => [const IdState(counter: -1, wasIncremented: false)],
    );
  });
}
