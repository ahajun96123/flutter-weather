import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wink_study/provider/counter.dart';
import 'package:wink_study/provider/weather.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>.value(value: Counter()),
        ChangeNotifierProvider<Weather>.value(value: Weather()),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.brown,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    var weather = Provider.of<Weather>(context);
    var mainWeatherDesc = weather.weatherInfo == null
        ? ''
        : weather.weatherInfo['weather'][0]['main'];
    String bgImg = 'assets/weather.jfif';
    if(mainWeatherDesc=='Clear'){
      bgImg = 'assets/clear.jpg';
    } else if(mainWeatherDesc=='Clouds'){
      bgImg = 'assets/cloud.jpg';
    } else if(mainWeatherDesc=='Rain'){
      bgImg = 'assets/rainy.jpeg';
    }
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImg),
            fit: BoxFit.cover,
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Provider Pattern'),
          ),
          body: ListView(
            children: <Widget>[
              MyCounter(),
              //MyButtons(),
              Divider(color: Colors.black),
              MyWeather(),
            ],
          ),
        ),
      );
  }
}

class MyCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var counter = Provider.of<Counter>(context);
    var weather = Provider.of<Weather>(context);
    String we =  weather.weatherInfo == null
        ? 'Please enter your country name.'
        : weather.weatherInfo['weather'][0]['main'];
    var celsius =  weather.weatherInfo == null
        ? '273.15'
        : weather.weatherInfo['main']['temp'].toString();
    var cel = double.parse(celsius);
    var humidity =  weather.weatherInfo == null
        ? '0'
        : weather.weatherInfo['main']['humidity'].toString();
    cel -= 273.15;

    return Padding(
      padding: EdgeInsets.only(top: 56, bottom: 24),
      child: Center(
        child: Column(
          children: <Widget>[
//            Container(
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Icon(Icons.cloud, color: Colors.white),
//                  Padding(padding: EdgeInsets.only(right: 10.0, bottom:50.0),),
//                  Text(
//                    'Weather : ',
//                    style: TextStyle(
//                      fontSize: 16,
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold
//                    ),
//                  )
//                ],
//              ),
//            ),
            Text(
              weather.cityName,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                letterSpacing: 10,
                color: Colors.pinkAccent[200],
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),

            Text(
              we,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 9.0,
            ),
            Text(
              '${cel.round()}°C',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 9.0,
            ),
            Text(
              'humidity: ${humidity}',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        )
//        Consumer<Counter>(
//          builder: (context, sungwon, child) =>
//              Text(
//                '${sungwon.count}',
//                style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 48.0,
//                ),
//              ),
//        ),
      ),
    );
  }
}
class MyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Center(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: counter.incrementCounter,
//              onPressed: (){
//                Provider.of<Counter>(context, listen: false).incrementCounter();
//              },
              child: Text('Increment'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
            RaisedButton(
              onPressed: counter.decrementCounter,
              child: Text('Decrement'),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class MyWeather extends StatefulWidget {
  @override
  _MyWeatherState createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _locationController = TextEditingController();
  bool _autovalidate = false;

  @override
  void dispose(){
    _locationController.dispose();
    super.dispose();
  }

  _submit(Weather weather) {
    final form = _formKey.currentState;

    if (form.validate()) {
      final cityName = _locationController.text;
      print(cityName);
      weather.getWeather(cityName);
    } else {
      _autovalidate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var weather = Provider.of<Weather>(context);

    var mainWeatherDesc = weather.weatherInfo == null
        ? ''
        : weather.weatherInfo['weather'][0]['main'];

    return Form(
      key: _formKey,
      autovalidate: _autovalidate,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 36.0,
          horizontal: 16.0,
        ),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.search),
                labelText: 'City',
                hintText: 'Enter Location to watch for',
              ),
              validator: (value) {
                return value.length <= 1 ? 'Loaction too short' : null;
              },
            ),
            mainWeatherDesc.length > 0
                ? Padding( // 조건 ? 조건이 맞으면 실행 : 조건이 틀리면 실행
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                mainWeatherDesc,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
                : Container(child: Text("이런 값은 없다!!"),),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: RaisedButton(
                onPressed: () {
                  _submit(weather);
                },
                child: weather.loading
                    ? SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(),
                )
                    : Text('Get Weather'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}