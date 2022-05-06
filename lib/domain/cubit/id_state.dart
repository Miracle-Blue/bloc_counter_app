part of 'id_cubit.dart';

class IdState extends Equatable {
  final int counter;
  final bool wasIncremented;

  const IdState({required this.counter, this.wasIncremented = false});

  @override
  List<Object?> get props => [counter, wasIncremented];

  @override
  String toString() {
    return 'IdState{counter: $counter, wasIncremented: $wasIncremented}';
  }
}