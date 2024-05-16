enum Flavor { development, staging, production }

class FlavorConfig {
  static Flavor? appFlavor;
  static Map<Flavor?, String> urlOnFlavor = {
    Flavor.development: "https://dummyjson.com",
    Flavor.staging: "stagingUrl",
    Flavor.production: "productoinUrl",
    null: "https://dummyjson.com"
  };
  static String get url => urlOnFlavor[appFlavor]!;
}
