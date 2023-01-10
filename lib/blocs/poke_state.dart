part of 'poke_cubit.dart';

@immutable
abstract class PokeState {}

class PokeInitial extends PokeState {}

class PokemonGetSuccessState extends PokeState{}
class PokemonGetLoadingState extends PokeState{}
class PokemonGetErrorState extends PokeState{}