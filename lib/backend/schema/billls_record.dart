import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BilllsRecord extends FirestoreRecord {
  BilllsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "receiptImage" field.
  String? _receiptImage;
  String get receiptImage => _receiptImage ?? '';
  bool hasReceiptImage() => _receiptImage != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "completedDate" field.
  DateTime? _completedDate;
  DateTime? get completedDate => _completedDate;
  bool hasCompletedDate() => _completedDate != null;

  // "billimage" field.
  String? _billimage;
  String get billimage => _billimage ?? '';
  bool hasBillimage() => _billimage != null;

  // "userReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  bool hasUserReference() => _userReference != null;

  // "proofImage" field.
  String? _proofImage;
  String get proofImage => _proofImage ?? '';
  bool hasProofImage() => _proofImage != null;

  // "billNumber" field.
  int? _billNumber;
  int get billNumber => _billNumber ?? 0;
  bool hasBillNumber() => _billNumber != null;

  // "adminHowHandle" field.
  DocumentReference? _adminHowHandle;
  DocumentReference? get adminHowHandle => _adminHowHandle;
  bool hasAdminHowHandle() => _adminHowHandle != null;

  // "billAmount" field.
  int? _billAmount;
  int get billAmount => _billAmount ?? 0;
  bool hasBillAmount() => _billAmount != null;

  // "billFee" field.
  int? _billFee;
  int get billFee => _billFee ?? 0;
  bool hasBillFee() => _billFee != null;

  // "adminUploadedBill" field.
  String? _adminUploadedBill;
  String get adminUploadedBill => _adminUploadedBill ?? '';
  bool hasAdminUploadedBill() => _adminUploadedBill != null;

  // "billCategories" field.
  DocumentReference? _billCategories;
  DocumentReference? get billCategories => _billCategories;
  bool hasBillCategories() => _billCategories != null;

  // "billid" field.
  String? _billid;
  String get billid => _billid ?? '';
  bool hasBillid() => _billid != null;

  // "declineReason" field.
  String? _declineReason;
  String get declineReason => _declineReason ?? '';
  bool hasDeclineReason() => _declineReason != null;

  void _initializeFields() {
    _receiptImage = snapshotData['receiptImage'] as String?;
    _status = snapshotData['status'] as String?;
    _completedDate = snapshotData['completedDate'] as DateTime?;
    _billimage = snapshotData['billimage'] as String?;
    _userReference = snapshotData['userReference'] as DocumentReference?;
    _proofImage = snapshotData['proofImage'] as String?;
    _billNumber = castToType<int>(snapshotData['billNumber']);
    _adminHowHandle = snapshotData['adminHowHandle'] as DocumentReference?;
    _billAmount = castToType<int>(snapshotData['billAmount']);
    _billFee = castToType<int>(snapshotData['billFee']);
    _adminUploadedBill = snapshotData['adminUploadedBill'] as String?;
    _billCategories = snapshotData['billCategories'] as DocumentReference?;
    _billid = snapshotData['billid'] as String?;
    _declineReason = snapshotData['declineReason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('billls');

  static Stream<BilllsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BilllsRecord.fromSnapshot(s));

  static Future<BilllsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BilllsRecord.fromSnapshot(s));

  static BilllsRecord fromSnapshot(DocumentSnapshot snapshot) => BilllsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BilllsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BilllsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BilllsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BilllsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBilllsRecordData({
  String? receiptImage,
  String? status,
  DateTime? completedDate,
  String? billimage,
  DocumentReference? userReference,
  String? proofImage,
  int? billNumber,
  DocumentReference? adminHowHandle,
  int? billAmount,
  int? billFee,
  String? adminUploadedBill,
  DocumentReference? billCategories,
  String? billid,
  String? declineReason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'receiptImage': receiptImage,
      'status': status,
      'completedDate': completedDate,
      'billimage': billimage,
      'userReference': userReference,
      'proofImage': proofImage,
      'billNumber': billNumber,
      'adminHowHandle': adminHowHandle,
      'billAmount': billAmount,
      'billFee': billFee,
      'adminUploadedBill': adminUploadedBill,
      'billCategories': billCategories,
      'billid': billid,
      'declineReason': declineReason,
    }.withoutNulls,
  );

  return firestoreData;
}

class BilllsRecordDocumentEquality implements Equality<BilllsRecord> {
  const BilllsRecordDocumentEquality();

  @override
  bool equals(BilllsRecord? e1, BilllsRecord? e2) {
    return e1?.receiptImage == e2?.receiptImage &&
        e1?.status == e2?.status &&
        e1?.completedDate == e2?.completedDate &&
        e1?.billimage == e2?.billimage &&
        e1?.userReference == e2?.userReference &&
        e1?.proofImage == e2?.proofImage &&
        e1?.billNumber == e2?.billNumber &&
        e1?.adminHowHandle == e2?.adminHowHandle &&
        e1?.billAmount == e2?.billAmount &&
        e1?.billFee == e2?.billFee &&
        e1?.adminUploadedBill == e2?.adminUploadedBill &&
        e1?.billCategories == e2?.billCategories &&
        e1?.billid == e2?.billid &&
        e1?.declineReason == e2?.declineReason;
  }

  @override
  int hash(BilllsRecord? e) => const ListEquality().hash([
        e?.receiptImage,
        e?.status,
        e?.completedDate,
        e?.billimage,
        e?.userReference,
        e?.proofImage,
        e?.billNumber,
        e?.adminHowHandle,
        e?.billAmount,
        e?.billFee,
        e?.adminUploadedBill,
        e?.billCategories,
        e?.billid,
        e?.declineReason
      ]);

  @override
  bool isValidKey(Object? o) => o is BilllsRecord;
}
