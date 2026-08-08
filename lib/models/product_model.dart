class ProductModel {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String price;
  final String currency;
  final String image;
  final Specs? specs;

  ProductModel({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.price,
    required this.currency,
    required this.image,
    this.specs,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      tagline: json['tagline'] ?? '',
      description: json['description'] ?? '',
      price: json['price']?.toString() ?? '',
      currency: json['currency'] ?? '',
      image: json['image'] ?? '',
      specs: json['specs'] != null
          ? Specs.fromJson(json['specs'])
          : null,
    );
  }
}

class Specs {
  final String? chip;
  final String? material;
  final String? camera;
  final String? display;
  final String? battery;
  final String? ports;
  final String? weight;
  final String? design;
  final String? colors;
  final String? screen;
  final String? pencil;
  final String? connectivity;
  final String? caseType;
  final String? brightness;
  final String? gps;
  final String? feature;
  final String? carbon;
  final String? os;
  final String? control;
  final String? audio;
  final String? caseSpec;
  final String? driver;
  final String? cancellation;
  final String? materials;
  final String? home;
  final String? sensing;
  final String? size;

  Specs({
    this.chip,
    this.material,
    this.camera,
    this.display,
    this.battery,
    this.ports,
    this.weight,
    this.design,
    this.colors,
    this.screen,
    this.pencil,
    this.connectivity,
    this.caseType,
    this.brightness,
    this.gps,
    this.feature,
    this.carbon,
    this.os,
    this.control,
    this.audio,
    this.caseSpec,
    this.driver,
    this.cancellation,
    this.materials,
    this.home,
    this.sensing,
    this.size,
  });

  factory Specs.fromJson(Map<String, dynamic> json) {
    return Specs(
      chip: json['chip']?.toString(),
      material: json['material']?.toString(),
      camera: json['camera']?.toString(),
      display: json['display']?.toString(),
      battery: json['battery']?.toString(),
      ports: json['ports']?.toString(),
      weight: json['weight']?.toString(),
      design: json['design']?.toString(),
      colors: json['colors']?.toString(),
      screen: json['screen']?.toString(),
      pencil: json['pencil']?.toString(),
      connectivity: json['connectivity']?.toString(),
      caseType: json['case']?.toString(),
      brightness: json['brightness']?.toString(),
      gps: json['gps']?.toString(),
      feature: json['feature']?.toString(),
      carbon: json['carbon']?.toString(),
      os: json['os']?.toString(),
      control: json['control']?.toString(),
      audio: json['audio']?.toString(),
      caseSpec: json['case_spec']?.toString(),
      driver: json['driver']?.toString(),
      cancellation: json['cancellation']?.toString(),
      materials: json['materials']?.toString(),
      home: json['home']?.toString(),
      sensing: json['sensing']?.toString(),
      size: json['size']?.toString(),
    );
  }
}