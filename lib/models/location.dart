class PlaceLocation {
  const PlaceLocation(
      {required this.long, required this.lat, required this.address});
  final double long;
  final double lat;
  final String address;
}

class Place {
  Place({
    required this.location,
  });

  final PlaceLocation location;
}
