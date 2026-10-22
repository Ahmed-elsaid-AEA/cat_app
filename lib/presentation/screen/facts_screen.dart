import 'package:cat_app/core/app_get_it.dart';
import 'package:cat_app/presentation/controllers/facts/facts_cubit.dart';
import 'package:cat_app/presentation/controllers/facts/facts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactsScreen extends StatelessWidget {
  const FactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FactsCubit>(
      lazy: false,
      create: (context) =>
          FactsCubit(getCatFactsUseCase: getIt.getCatFactsUseCase),
      child: BlocBuilder<FactsCubit, FactsState>(
        builder: (context, state) {
          return Scaffold(
            body: state.screenState.isLoading
                ? Center(child: CircularProgressIndicator())
                : state.screenState.isFailure
                ? Center(child: Text(state.error ?? ""))
                : Center(
                    child: Text(
                      "Facts is ${state.factsEntity?.fact ?? ""} , length ${state.factsEntity?.length}",
                    ),
                  ),
          );
        },
      ),
    );
  }
}
