import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShareRecord extends FirestoreRecord {
  ShareRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "shareURL" field.
  String? _shareURL;
  String get shareURL => _shareURL ?? '';
  bool hasShareURL() => _shareURL != null;

  // "policyList" field.
  List<String>? _policyList;
  List<String> get policyList => _policyList ?? const [];
  bool hasPolicyList() => _policyList != null;

  // "whatsAppUrl" field.
  String? _whatsAppUrl;
  String get whatsAppUrl => _whatsAppUrl ?? '';
  bool hasWhatsAppUrl() => _whatsAppUrl != null;

  // "gmailUrl" field.
  String? _gmailUrl;
  String get gmailUrl => _gmailUrl ?? '';
  bool hasGmailUrl() => _gmailUrl != null;

  // "phoneUrl" field.
  String? _phoneUrl;
  String get phoneUrl => _phoneUrl ?? '';
  bool hasPhoneUrl() => _phoneUrl != null;

  // "youtubeLink" field.
  String? _youtubeLink;
  String get youtubeLink => _youtubeLink ?? '';
  bool hasYoutubeLink() => _youtubeLink != null;

  void _initializeFields() {
    _shareURL = snapshotData['shareURL'] as String?;
    _policyList = getDataList(snapshotData['policyList']);
    _whatsAppUrl = snapshotData['whatsAppUrl'] as String?;
    _gmailUrl = snapshotData['gmailUrl'] as String?;
    _phoneUrl = snapshotData['phoneUrl'] as String?;
    _youtubeLink = snapshotData['youtubeLink'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('share');

  static Stream<ShareRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShareRecord.fromSnapshot(s));

  static Future<ShareRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShareRecord.fromSnapshot(s));

  static ShareRecord fromSnapshot(DocumentSnapshot snapshot) => ShareRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShareRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShareRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShareRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShareRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShareRecordData({
  String? shareURL,
  String? whatsAppUrl,
  String? gmailUrl,
  String? phoneUrl,
  String? youtubeLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'shareURL': shareURL,
      'whatsAppUrl': whatsAppUrl,
      'gmailUrl': gmailUrl,
      'phoneUrl': phoneUrl,
      'youtubeLink': youtubeLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShareRecordDocumentEquality implements Equality<ShareRecord> {
  const ShareRecordDocumentEquality();

  @override
  bool equals(ShareRecord? e1, ShareRecord? e2) {
    const listEquality = ListEquality();
    return e1?.shareURL == e2?.shareURL &&
        listEquality.equals(e1?.policyList, e2?.policyList) &&
        e1?.whatsAppUrl == e2?.whatsAppUrl &&
        e1?.gmailUrl == e2?.gmailUrl &&
        e1?.phoneUrl == e2?.phoneUrl &&
        e1?.youtubeLink == e2?.youtubeLink;
  }

  @override
  int hash(ShareRecord? e) => const ListEquality().hash([
        e?.shareURL,
        e?.policyList,
        e?.whatsAppUrl,
        e?.gmailUrl,
        e?.phoneUrl,
        e?.youtubeLink
      ]);

  @override
  bool isValidKey(Object? o) => o is ShareRecord;
}
