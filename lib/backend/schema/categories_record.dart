import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "orderNo" field.
  int? _orderNo;
  int get orderNo => _orderNo ?? 0;
  bool hasOrderNo() => _orderNo != null;

  // "isVisible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  bool hasIsVisible() => _isVisible != null;

  // "field1Text" field.
  String? _field1Text;
  String get field1Text => _field1Text ?? '';
  bool hasField1Text() => _field1Text != null;

  // "field2Text" field.
  String? _field2Text;
  String get field2Text => _field2Text ?? '';
  bool hasField2Text() => _field2Text != null;

  // "field3Text" field.
  String? _field3Text;
  String get field3Text => _field3Text ?? '';
  bool hasField3Text() => _field3Text != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _orderNo = castToType<int>(snapshotData['orderNo']);
    _isVisible = snapshotData['isVisible'] as bool?;
    _field1Text = snapshotData['field1Text'] as String?;
    _field2Text = snapshotData['field2Text'] as String?;
    _field3Text = snapshotData['field3Text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? name,
  String? image,
  int? orderNo,
  bool? isVisible,
  String? field1Text,
  String? field2Text,
  String? field3Text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'orderNo': orderNo,
      'isVisible': isVisible,
      'field1Text': field1Text,
      'field2Text': field2Text,
      'field3Text': field3Text,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.orderNo == e2?.orderNo &&
        e1?.isVisible == e2?.isVisible &&
        e1?.field1Text == e2?.field1Text &&
        e1?.field2Text == e2?.field2Text &&
        e1?.field3Text == e2?.field3Text;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.image,
        e?.orderNo,
        e?.isVisible,
        e?.field1Text,
        e?.field2Text,
        e?.field3Text
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
