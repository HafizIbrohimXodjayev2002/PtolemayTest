class Failure {
  const Failure(this.message, {this.code, this.type});

  final String message;
  final int? code;
  final String? type;

  @override
  String toString() {
    return message;
  }
}