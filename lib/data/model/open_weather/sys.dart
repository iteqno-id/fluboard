class Sys {
  Sys({
    required this.pod,
  });

  final String pod;

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json["pod"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "pod": pod,
      };
}
