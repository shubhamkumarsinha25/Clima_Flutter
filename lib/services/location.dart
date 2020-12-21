import 'package:geolocator/geolocator.dart';


class Location{
  double latitude;
  double longitude;
  Future<void>getcurrentlocation()async
  {
    try {
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}
//Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);