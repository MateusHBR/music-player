enum DomainError {
  unexpected,
}

extension DomainErrorExtension on DomainError {
  String get message {
    switch (this) {
      case DomainError.unexpected:
        return "Ocorreu um erro não esperado, porfavor tente novamente.";

      default:
        return "";
    }
  }
}
