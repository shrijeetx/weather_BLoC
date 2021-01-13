part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageInitial extends HomePageState {
  @override
  List<Object> get props => [];
}

class WeatherIsLoading extends HomePageState{
  @override
  List<Object> get props => throw UnimplementedError();
}

class WeatherIsLoaded extends HomePageState{
  final WeatherResponse _response;
  WeatherIsLoaded(this._response);

  WeatherResponse get getResponse => _response;

  @override
  List<Object> get props => throw UnimplementedError();
}

class WeatherLoadingFailed extends HomePageState{
  @override
  List<Object> get props => throw UnimplementedError();
}
