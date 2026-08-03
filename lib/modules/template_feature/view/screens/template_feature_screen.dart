import 'package:flutter/material.dart';

part './helper/template_feature_helper.dart';

class TemplateFeatureScreen extends StatelessWidget {
  const TemplateFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TemplateFeatureHelper.appbarTitle)),
    );
  }
}
