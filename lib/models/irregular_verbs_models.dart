class IrregularVerbsModels {
  final int id;
  final String type; // 'regular' or 'irregular'
  final Map<String, String>
      english; // Contains present, past, and past participle
  final String spanish; // Spanish translation
  final Map<String, String>
      examples; // Contains present, past, and past participle examples

  IrregularVerbsModels({
    required this.id,
    required this.type,
    required this.english,
    required this.spanish,
    required this.examples,
  });

  // Factory method to create a IrregularVerbsModels from JSON
  factory IrregularVerbsModels.fromJson(Map<String, dynamic> json) {
    return IrregularVerbsModels(
      id: json['id'],
      type: json['type'],
      english: {
        'present': json['english']['present'],
        'past': json['english']['past'],
        'past_participle': json['english']['past_participle'],
      },
      spanish: json['spanish'],
      examples: {
        'present': json['examples']['present'],
        'past': json['examples']['past'],
        'past_participle': json['examples']['past_participle'],
      },
    );
  }

  // Method to convert IrregularVerbsModels to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'english': english,
      'spanish': spanish,
      'examples': examples,
    };
  }
}
