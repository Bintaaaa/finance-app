extension ReturnOldValue on dynamic {
  dynamic returnOldValue() => this == "" ? null : this;
  String returnEmptyString({String? value}) => this != null ? toString() : value ?? "";
}
