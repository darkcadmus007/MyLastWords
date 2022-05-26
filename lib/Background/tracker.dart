import 'package:geolocator/geolocator.dart';
import 'package:mylastwords/Services/userLogs_services.dart';
import 'package:mylastwords/models/api_response.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';

class UserTracker {
  Future<void> sendUserLogData() async {
    var locationString = "";
    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      // var position = await Geolocator()
      //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      var lastposition = await Geolocator().getLastKnownPosition();
      locationString =
          ('${lastposition.latitude}' + ', ' + '${lastposition.longitude}');
      ApiResponse response = await addUserLogCall(
          DateTime.now(), DateTime.now(), locationString.toString());
      if (response.error == null) {
        print("No error");
      } else {
        print('${response.error}');
      }
    } else {}
  }
}
