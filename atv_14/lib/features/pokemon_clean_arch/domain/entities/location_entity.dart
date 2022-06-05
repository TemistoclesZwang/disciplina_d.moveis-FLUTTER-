import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String location_area;

  LocationEntity ({
    required this.location_area, 
    });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
