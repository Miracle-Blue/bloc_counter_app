import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'id_state.dart';

class IdCubit extends Cubit<IdState> {
  IdCubit() : super(const IdState(counter: 0));

  void increment() => emit(IdState(counter: state.counter + 1, wasIncremented: true));

  void decrement() => emit(IdState(counter: state.counter - 1, wasIncremented: false));

  @override
  void onChange(Change<IdState> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
