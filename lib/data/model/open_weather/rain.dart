class Rain {
  Rain({
    required this.the3H,
  });

  final double the3H;

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      the3H: json["3h"] ?? 0.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "3h": the3H,
      };
}
