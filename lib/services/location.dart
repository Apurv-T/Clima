import 'package:geolocator/geolocator.dart';

class location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Location access denied');
    }
  }

  double getLatitude() {
    return latitude;
  }

  double getLongitude() {
    return longitude;
  }
}
