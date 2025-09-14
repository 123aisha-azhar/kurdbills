import '/backend/backend.dart';
import '/components/back_iamge_widget.dart';
import '/components/upload_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'take_pic_widget.dart' show TakePicWidget;
import 'package:flutter/material.dart';

class TakePicModel extends FlutterFlowModel<TakePicWidget> {
  ///  Local state fields for this page.

  bool showImage = true;

  ///  State fields for stateful widgets in this page.

  // Model for backIamge component.
  late BackIamgeModel backIamgeModel;
  // State field(s) for billNum widget.
  FocusNode? billNumFocusNode1;
  TextEditingController? billNumTextController1;
  String? Function(BuildContext, String?)? billNumTextController1Validator;
  // State field(s) for billNum widget.
  FocusNode? billNumFocusNode2;
  TextEditingController? billNumTextController2;
  String? Function(BuildContext, String?)? billNumTextController2Validator;
  // State field(s) for billNum widget.
  FocusNode? billNumFocusNode3;
  TextEditingController? billNumTextController3;
  String? Function(BuildContext, String?)? billNumTextController3Validator;
  // Stores action output result for [Custom Action - generateBillId] action in Container widget.
  int? billId;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  BilllsRecord? currentBill;
  // Model for uploadImage component.
  late UploadImageModel uploadImageModel;
  bool isDataUploading_uploadDataDci = false;
  FFUploadedFile uploadedLocalFile_uploadDataDci =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataDci = '';

  @override
  void initState(BuildContext context) {
    backIamgeModel = createModel(context, () => BackIamgeModel());
    uploadImageModel = createModel(context, () => UploadImageModel());
  }

  @override
  void dispose() {
    backIamgeModel.dispose();
    billNumFocusNode1?.dispose();
    billNumTextController1?.dispose();

    billNumFocusNode2?.dispose();
    billNumTextController2?.dispose();

    billNumFocusNode3?.dispose();
    billNumTextController3?.dispose();

    uploadImageModel.dispose();
  }
}
