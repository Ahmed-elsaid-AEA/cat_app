import 'package:cat_app/core/enums/widget_state_enum.dart';
import 'package:cat_app/domain/entities/breeds_entity.dart';
import 'package:equatable/equatable.dart';

class BreedsState extends Equatable {
  final List<BreedsEntity> listBreeds;
  final WidgetStateEnum screenState;
  final String? error;
  const BreedsState({
    this.listBreeds = const [],
    this.error,
    this.screenState = WidgetStateEnum.init,
  });

  BreedsState copyWith({
    List<BreedsEntity>? listBreeds,
    String? error,
    WidgetStateEnum? screenState,
  }) {
    return BreedsState(
      listBreeds: listBreeds ?? this.listBreeds,
      error: error ?? this.error,
      screenState: screenState ?? this.screenState,
    );
  }

  @override
  List<Object?> get props => [listBreeds, error, screenState];
}
