class TemplateFeatureModel {
  final Object testParameter;

  const TemplateFeatureModel({required this.testParameter});

  factory TemplateFeatureModel.fromJson(Map<String, dynamic> json) {
    return TemplateFeatureModel(
      // Don't forget to use ModelParser.-----(),
      testParameter: json['testParameterQuery'] as Object,
    );
  }

  String toJson() {
    return '{"testParameterQuery": "$testParameter"}';
  }
}
