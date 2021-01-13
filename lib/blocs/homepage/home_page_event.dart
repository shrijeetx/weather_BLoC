part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class SearchWeather extends HomePageEvent{
  final String _city;
  SearchWeather(this._city);
  @override
  // TODO: implement props
  List<Object> get props => [_city];
}
