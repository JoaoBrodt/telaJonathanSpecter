enum Flavor {
  PROD,
  DEV,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'Demeter';
      case Flavor.DEV:
        return 'Demeter dev';
      default:
        return 'title';
    }
  }

}
