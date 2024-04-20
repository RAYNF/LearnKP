import 'dart:ffi';

class Location {
  String name;
  double latitude;
  double longtitude;

  Location(this.name, this.latitude, this.longtitude);
}

class FakeData {
  static List<Location> fakeLocation = [
    Location("CCTV1", -6.990150823745946, 110.42147509084245),
  ];
}
