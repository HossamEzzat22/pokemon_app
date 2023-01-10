import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_api/models/myPoke.dart';
import 'package:pokemon_api/services/dio_helper/dio_service.dart';
import 'package:pokemon_api/services/sp_helper/sp_helper.dart';

part 'poke_state.dart';

class PokeCubit extends Cubit<PokeState> {
  PokeCubit() : super(PokeInitial());
  
  static PokeCubit get(context)=>BlocProvider.of(context);
  MyPoke? myPoke;


  getAllPokemons()
  {
    emit(PokemonGetLoadingState());
    print('loading...');
    DioHelper.getData().then((value) {
      var json =jsonDecode(value!.data);
      myPoke = MyPoke.fromJson(json);
      print(12);
      emit(PokemonGetSuccessState());
      print('${value.data}');
    }).catchError((error) {
      print('error');
      print(error.toString());
      emit(PokemonGetErrorState());
    });
  }
}
