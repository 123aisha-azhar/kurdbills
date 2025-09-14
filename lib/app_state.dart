import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _showTermsFromSettings = false;
  bool get showTermsFromSettings => _showTermsFromSettings;
  set showTermsFromSettings(bool value) {
    _showTermsFromSettings = value;
  }

  bool _canResendCode = false;
  bool get canResendCode => _canResendCode;
  set canResendCode(bool value) {
    _canResendCode = value;
  }

  bool _CanPendingOrProgress = false;
  bool get CanPendingOrProgress => _CanPendingOrProgress;
  set CanPendingOrProgress(bool value) {
    _CanPendingOrProgress = value;
  }

  String _billimage = '';
  String get billimage => _billimage;
  set billimage(String value) {
    _billimage = value;
  }

  String _receiptImage = '';
  String get receiptImage => _receiptImage;
  set receiptImage(String value) {
    _receiptImage = value;
  }

  DocumentReference? _admin =
      FirebaseFirestore.instance.doc('/user/yDs5qKITs7M431zQO3IBufJfcPC2');
  DocumentReference? get admin => _admin;
  set admin(DocumentReference? value) {
    _admin = value;
  }
}
