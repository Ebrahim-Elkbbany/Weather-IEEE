import 'package:location/location.dart';

class LocationService{
  Location locationManager = Location();

  Future<bool> isServiceEnabled()async{
    var serviceEnabled =await locationManager.serviceEnabled();
    return serviceEnabled;
  }

  Future<bool> requestService()async{
    var requestService = await locationManager.requestService();
    return requestService;
  }

  Future<bool> isPermissionGranted()async{
    var permissionStatus = await locationManager.hasPermission();
    return permissionStatus==PermissionStatus.granted;
  }

  Future<bool> requestPermission()async{
    var permissionStatus = await locationManager.requestPermission();
    return permissionStatus==PermissionStatus.granted;
  }

  Future<LocationData?> getLocation()async{
   bool isServiceEnabled= await requestService();
   bool isPermissionGranted = await requestPermission();
    if(! isServiceEnabled  ||! isPermissionGranted ){
      return null;
    }
    return locationManager.getLocation();
  }

  Stream<LocationData> trackLocation(){
    return locationManager.onLocationChanged;
  }


}