import 'package:cat_app/core/enums/widget_state_enum.dart';
import 'package:cat_app/domain/entities/facts_entity.dart';
import 'package:equatable/equatable.dart';

class FactsState extends Equatable {
  final FactsEntity? factsEntity;
  final WidgetStateEnum screenState;
  final String? error;
  const FactsState({
    this.factsEntity,
    this.error,
    this.screenState = WidgetStateEnum.init,
  });

  FactsState copyWith({
    FactsEntity? factsEntity,
    String? error,
    WidgetStateEnum? screenState,
  }) {
    return FactsState(
      factsEntity: factsEntity ?? this.factsEntity,
      error: error ?? this.error,
      screenState: screenState ?? this.screenState,
    );
  }

  @override
  List<Object?> get props => [factsEntity, error, screenState];
}
