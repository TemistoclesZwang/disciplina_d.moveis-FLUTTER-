import '../../domain/entities/pokemon_entity.dart';

class PokemonEntityModel extends PokemonEntity {
  PokemonEntityModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory PokemonEntityModel.fromJson(Map<String, dynamic> json) {
    return PokemonEntityModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
