class Intent {
  final String name;
  final double confidence;
  final Map<String, dynamic> parameters;

  Intent({
    required this.name,
    required this.confidence,
    required this.parameters,
  });

  factory Intent.fromJson(Map<String, dynamic> json) => Intent(
        name: json['name'],
        confidence: json['confidence'],
        parameters: json['parameters'],
      );
}
