class GPTResponse {
  final String message;
  final ResponseStatus status;

  GPTResponse({
    required this.message,
    required this.status,
  });
}

enum ResponseStatus {
  done,
  error,
}
