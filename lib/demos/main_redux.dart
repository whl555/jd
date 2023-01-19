import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';


void main() => runApp(MyApp());

typedef FetchTime = void Function();

class MyApp extends StatelessWidget {

  final store = Store(reducer,
      initialState: AppState.initialState(),
      middleware: [thunkMiddleware]);



// root widget
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   const Text("Flutter Redux demo"),
      ),
      body:   Center(
        child:   Container(
          height: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // display time and location
              StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (_, state) {
                  return  Text(
                    'The time in ${state.location} is ${state.time}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  );
                },
              ),

              // fetch time button
              StoreConnector<AppState, FetchTime>(
                converter: (store) => () => store.dispatch(fetchTime),
                builder: (_, fetchTimeCallback) {
                  return   SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.amber),
                            textStyle: MaterialStateProperty.all(
                              TextStyle(
                                color: Colors.brown,
                              ),
                            )
                        ),
                        onPressed: fetchTimeCallback,
                        child:   const Text(
                          "Click to fetch time",
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.w600,
                              fontSize: 25
                          ),
                        )
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppState {
  final String _location;
  final String _time;

  String get location => _location;
  String get time => _time;

  AppState(this._location, this._time);

  AppState.initialState() : _location = "", _time = "00:00";

}

class FetchTimeAction {
  final String _location;
  final String _time;

  String get location => _location;
  String get time => _time;

  FetchTimeAction(this._location, this._time);
}

AppState reducer(AppState prev, dynamic action) {
  if (action is FetchTimeAction) {
    return AppState(action.location, action.time);
  } else {
    return prev;
  }
}

ThunkAction<AppState> fetchTime = (Store<AppState> store) async {

  List<dynamic> locations;

  try {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/'));
    locations = jsonDecode(response.body);
  }catch(e){
    print('caught error: $e');
    return;
  }

  String time;
  String location = locations[Random().nextInt(locations.length)] as String;
  try {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$location'));
    Map data = jsonDecode(response.body);
    print('caught data: $data');

    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    DateTime date = DateTime.parse(dateTime);
    date = date.add(Duration(hours: int.parse(offset)));
    time = DateFormat.jm().format(date);
  }catch(e){
    print('caught error: $e');
    time = "could not fetch time data";
    return;
  }

  List<String> val = location.split("/");
  location = "${val[1]}, ${val[0]}";

  store.dispatch(FetchTimeAction(location, time));
};