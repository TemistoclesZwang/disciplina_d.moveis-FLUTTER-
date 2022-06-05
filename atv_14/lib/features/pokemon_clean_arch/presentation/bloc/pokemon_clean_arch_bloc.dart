import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_clean_arch_event.dart';
part 'pokemon_clean_arch_state.dart';

class PokemonCleanArchBloc extends Bloc<PokemonCleanArchEvent, PokemonCleanArchState> {
  PokemonCleanArchBloc() : super(PokemonCleanArchInitial()) {
    on<PokemonCleanArchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
