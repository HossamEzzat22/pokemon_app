import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_api/blocs/poke_cubit.dart';
import '../views/pokemons_view.dart';



class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>PokeCubit()..getAllPokemons())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PokemonsView(),
        ),
    );
  }
}