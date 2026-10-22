import 'package:cat_app/core/app_get_it.dart';
import 'package:cat_app/core/enums/widget_state_enum.dart';
import 'package:cat_app/presentation/controllers/breeds/breeds_cubit.dart';
import 'package:cat_app/presentation/controllers/breeds/breeds_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsScreen extends StatelessWidget {
  const BreedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BreedsCubit>(
      create: (context) =>
          BreedsCubit(getBreedsUseCase: getIt.getBreedsUseCase),
      child: Builder(
        builder: (context) {
          return BlocBuilder<BreedsCubit, BreedsState>(
            builder: (context, state) {
              return Scaffold(
                body: state.screenState .isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.screenState == WidgetStateEnum.failure
                    ? Center(child: Text(state.error ?? "Error"))
                    : ListView.builder(
                        itemCount: state.listBreeds.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.listBreeds[index].breed),
                          );
                        },
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
