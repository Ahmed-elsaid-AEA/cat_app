enum WidgetStateEnum {
  init,
  loading,
  success,
  failure;

  bool get isLoading => this == WidgetStateEnum.loading;
  bool get isSuccess => this == WidgetStateEnum.success;
  bool get isFailure => this == WidgetStateEnum.failure;
  bool get isInit => this == WidgetStateEnum.init;
}
