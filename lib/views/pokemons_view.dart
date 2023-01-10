import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_api/blocs/poke_cubit.dart';
import 'package:pokemon_api/models/myPoke.dart';
import 'package:pokemon_api/utils/app_navigator.dart';
import 'package:pokemon_api/views/single_pokemon_view.dart';



class PokemonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokeCubit,PokeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = PokeCubit.get(context);
        return
          cubit.myPoke==null
            ? Center(child: CircularProgressIndicator(color: Color(0xff00BCD4),)) :
        Scaffold(
            appBar: AppBar(
              title: Text(
                'Poke App',
              ),
              centerTitle: true,
              backgroundColor: Color(0xff00BCD4),
            ),
            body: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 18,
                  crossAxisCount: 2),
              itemCount: cubit.myPoke!.pokemon!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => SinglePokemonView(pokemon :cubit.myPoke!.pokemon![index])
                      ),
                    );
                  },
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Image.network(
                              cubit.myPoke!.pokemon![index].img.toString(),
                              height: 110,),
                            Flexible(
                              child: Text(
                                cubit.myPoke!.pokemon![index].name.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}

