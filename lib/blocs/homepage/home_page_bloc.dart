import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc_test/models/response.dart';
import 'dart:convert';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  WeatherResponse response;
  HomePageBloc() : super(HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if(event is SearchWeather){
      yield WeatherIsLoading();
      try{
        http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?q=${event._city}&units=metric&appid=498e2d629b884203d1c2d8e37a5ed13b');
        print(response.statusCode);
        print(response.body);
        WeatherResponse weatherResponseFromJson = WeatherResponse.fromJson(json.decode(response.body));
        print(weatherResponseFromJson.name);
        if(response.statusCode == 200){
          yield WeatherIsLoaded(weatherResponseFromJson);
        }else{
          yield WeatherLoadingFailed();
        }
      }catch(e){
        yield WeatherLoadingFailed();
      }
    }
  }
}
