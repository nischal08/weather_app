
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getGeoLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error("Location services are disabled");
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error("Location permissions is disabled");
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            "Location permissions are premanently denied, we cannot request permissions.");
      }
      print("Before Location : getLocation()");
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print("After Location : getLocation()");

      latitude = position.latitude;
      longitude = position.longitude;

      print("latitude" + latitude.toString());
      print("longitude" + longitude.toString());
    } catch (e) {
      print(e);
    }
  }
}
