import 'package:dsc_web/models/user.model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeStateNotLoaded extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateUnAuthenticated extends HomeState {}

class HomeStateLoaded extends HomeState {
  final UserModel userModel;
  HomeStateLoaded({required this.userModel});
}

class HomeStateError extends HomeState {
  final message;
  HomeStateError(this.message);
}
