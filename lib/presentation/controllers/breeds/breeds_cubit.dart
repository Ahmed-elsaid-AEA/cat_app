import 'package:cat_app/core/enums/widget_state_enum.dart';
import 'package:cat_app/domain/entities/breeds_entity.dart';
import 'package:cat_app/domain/usecases/get_breeds_use_case.dart';
import 'package:cat_app/presentation/controllers/breeds/breeds_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsCubit extends Cubit<BreedsState> {
  final GetBreedsUseCase getBreedsUseCase;
  BreedsCubit({required this.getBreedsUseCase}) : super(const BreedsState()) {
    _getBreeds();
  }
  void _changeScreenState(WidgetStateEnum screenState) {
    if (!isClosed) emit(state.copyWith(screenState: screenState));
  }

  void _getBreeds() async {
    _changeScreenState(WidgetStateEnum.loading);
    Either<String, List<BreedsEntity>> facts = await getBreedsUseCase();
    facts.fold(
      (String failure) {
        _changeScreenState(WidgetStateEnum.failure);
        if (!isClosed) {
          emit(state.copyWith(error: failure));
        }
      },
      (List<BreedsEntity> breeds) {
        if (!isClosed) emit(state.copyWith(listBreeds: breeds));
        _changeScreenState(WidgetStateEnum.success);
      },
    );
  }
}
