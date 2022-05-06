part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType type;

  InternetConnected({required this.type});
}

class InternetDisconnected extends InternetState {}