import 'package:cat_app/core/enums/widget_state_enum.dart';
import 'package:cat_app/domain/entities/facts_entity.dart';
import 'package:cat_app/domain/usecases/get_cat_facts_use_case.dart';
import 'package:cat_app/presentation/controllers/facts/facts_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactsCubit extends Cubit<FactsState> {
  final GetCatFactsUseCase getCatFactsUseCase;
  FactsCubit({required this.getCatFactsUseCase}) : super(const FactsState()) {
    _getFacts();
  }
  void _changeScreenState(WidgetStateEnum screenState) {
    if (!isClosed) emit(state.copyWith(screenState: screenState));
  }

  void _getFacts() async {
    _changeScreenState(WidgetStateEnum.loading);
    Either<String, FactsEntity> facts = await getCatFactsUseCase();
    facts.fold(
      (String failure) {
        _changeScreenState(WidgetStateEnum.failure);
        if (!isClosed) {
          emit(state.copyWith(error: failure));
        }
      },
      (FactsEntity facts) {
        if (!isClosed) emit(state.copyWith(factsEntity: facts));
        _changeScreenState(WidgetStateEnum.success);
      },
    );
  }
}
