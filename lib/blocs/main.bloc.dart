import 'package:dsc_web/states/home.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home.bloc.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() {
    return [
      BlocProvider<HomeBloc>(create: (ctx) => HomeBloc(HomeStateNotLoaded())),
    ];
  }
}
