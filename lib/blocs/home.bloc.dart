import 'package:bloc/bloc.dart';
import 'package:dsc_web/events/home.event.dart';
import 'package:dsc_web/repo/home.repo.dart';
import 'package:dsc_web/states/home.state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);
  HomeRepo _homeRepo = HomeRepo();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeEventLoadData) {
      yield HomeStateLoading();
      try {
        var user = await this._homeRepo.getData();
        yield HomeStateLoaded(userModel: user);
      } catch (e) {
        if (e == "403")
          yield HomeStateUnAuthenticated();
        else
          yield HomeStateError(e);
      }
    }
  }
}
