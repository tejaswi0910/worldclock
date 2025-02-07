import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for the ui
  String time = ""; //time in that location
  String flag; //url to an asset's flag icon
  String url;  //this is the location url for api end point eg: Europe/London
  bool isDayTime = true; //is it day or night rn

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{  //future function is a placeholder function until the function gets actually executed
    try{
      Response response = await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['dateTime'];
      //create a DatEtIME OBJECT
      DateTime now = DateTime.parse(datetime);
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }catch(e){
      print(e.toString());
      time = 'could not get time data';
    }
  }
}

