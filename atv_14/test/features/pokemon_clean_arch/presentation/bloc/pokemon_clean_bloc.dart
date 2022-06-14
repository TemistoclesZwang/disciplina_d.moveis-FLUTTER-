import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_clean_event.dart';
part 'pokemon_clean_state.dart';

class PokemonCleanBloc extends Bloc<PokemonCleanEvent, PokemonCleanState> {
  PokemonCleanBloc() : super(PokemonCleanInitial()) {
    on<PokemonCleanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
