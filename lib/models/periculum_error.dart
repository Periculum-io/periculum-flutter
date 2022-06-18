class PericulumError implements Exception {
  String message;

  PericulumError(this.message);

  @override
  String toString() {
    return 'Periculum Error: $message';
  }
}
