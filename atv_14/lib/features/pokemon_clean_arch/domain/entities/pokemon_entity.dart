import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;

  PokemonEntity ({
    required this.id, 
    required this.name, 
    });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
