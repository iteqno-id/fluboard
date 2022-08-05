class Clouds {
  Clouds({
    required this.all,
  });

  final int all;

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json["all"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}
