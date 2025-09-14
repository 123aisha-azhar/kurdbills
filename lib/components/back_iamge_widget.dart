import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'back_iamge_model.dart';
export 'back_iamge_model.dart';

class BackIamgeWidget extends StatefulWidget {
  const BackIamgeWidget({super.key});

  @override
  State<BackIamgeWidget> createState() => _BackIamgeWidgetState();
}

class _BackIamgeWidgetState extends State<BackIamgeWidget> {
  late BackIamgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackIamgeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Image.asset(
        'assets/images/Android_Large_-_6_(1).png',
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
