import 'dart:typed_data';

class Lease {
  final int id;
  final Uint8List imageUrl;
  final double area;
  final String address;
  final DateTime time;

  Lease(
      {required this.id,
      required this.imageUrl,
      required this.area,
      required this.address,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "imageUrl": imageUrl,
      "area": area,
      "address": address,
      "time": time.toIso8601String()
    };
  }

  factory Lease.fromMap(Map<String, dynamic> map) {
    return Lease(
        id: map['id'],
        imageUrl: map['imageUrl'] as Uint8List,
        area: map['area'],
        address: map['address'],
        time: DateTime.parse(map['time']));
  }

  @override
  String toString() {
    // TODO: implement toString
    return "House{id: $id, imageUrl: $imageUrl, area: $area, address: $address, time: $time}";
  }
}
