import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_test/blocs/homepage/home_page_bloc.dart';
import 'package:weather_bloc_test/pages/weather_details.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: EnterCity(),
    );
  }
}

class EnterCity extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var enterField = Column(
      children: [
        Text(
          'Enter your city name',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        SizedBox(height: 18,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Color(0xff111122),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white54)),
              child: Column(
                children: [
                  Text(
                    'WEATHER',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    'CHECKER',
                    style: TextStyle(fontSize: 20, color: Colors.white54),
                  ),
                ],
              ),
            ),
            Spacer(flex: 8,),
            BlocListener<HomePageBloc,HomePageState>(
              listener: (context, state) {
                if(state is WeatherIsLoaded){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherDetails(
                    city: state.getResponse.name.toString(),
                    temp: state.getResponse.main.temp.toString(),
                    humidity: state.getResponse.main.humidity.toString(),
                  )));
                }
                if(state is WeatherLoadingFailed)
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Wrong City Name')));
              },
              child: BlocBuilder<HomePageBloc,HomePageState>(
                builder: (context,state){
                  return Column(
                    children: [
                      if(state is HomePageInitial)
                        enterField,
                      if(state is WeatherIsLoading)
                        CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      if(state is WeatherIsLoaded)
                        enterField,
                      if(state is WeatherLoadingFailed)
                        enterField,
                    ],
                  );
                },
              ),
            ),
            Spacer(flex: 4,),
            Builder(
              builder: (context) => FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                color: Color(0xff353546),
                onPressed: (){
                  if(_controller.text.isNotEmpty)
                    BlocProvider.of<HomePageBloc>(context).add(SearchWeather(_controller.text));
                  if(_controller.text.isEmpty)
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Enter City Name')));
                },
                child: Container(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text('SUBMIT'),
                  ),
                ),
              ),
            ),
            Spacer(flex: 10,),
          ],
        ),
      ),
    );
  }
}
