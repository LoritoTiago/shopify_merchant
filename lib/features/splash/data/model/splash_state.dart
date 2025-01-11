enum SplashStatus {
  isLoading(message: "Loading data"),

  haveError(message: "Something went wrong"),
  loaded(message: "Success");

  const SplashStatus({this.message = ""});
  final String message;
}
