// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PolicyStruct extends FFFirebaseStruct {
  PolicyStruct({
    String? tittle,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tittle = tittle,
        _description = description,
        super(firestoreUtilData);

  // "tittle" field.
  String? _tittle;
  String get tittle => _tittle ?? '';
  set tittle(String? val) => _tittle = val;

  bool hasTittle() => _tittle != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static PolicyStruct fromMap(Map<String, dynamic> data) => PolicyStruct(
        tittle: data['tittle'] as String?,
        description: data['description'] as String?,
      );

  static PolicyStruct? maybeFromMap(dynamic data) =>
      data is Map ? PolicyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'tittle': _tittle,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tittle': serializeParam(
          _tittle,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static PolicyStruct fromSerializableMap(Map<String, dynamic> data) =>
      PolicyStruct(
        tittle: deserializeParam(
          data['tittle'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PolicyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PolicyStruct &&
        tittle == other.tittle &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([tittle, description]);
}

PolicyStruct createPolicyStruct({
  String? tittle,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PolicyStruct(
      tittle: tittle,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PolicyStruct? updatePolicyStruct(
  PolicyStruct? policy, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    policy
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPolicyStructData(
  Map<String, dynamic> firestoreData,
  PolicyStruct? policy,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (policy == null) {
    return;
  }
  if (policy.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && policy.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final policyData = getPolicyFirestoreData(policy, forFieldValue);
  final nestedData = policyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = policy.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPolicyFirestoreData(
  PolicyStruct? policy, [
  bool forFieldValue = false,
]) {
  if (policy == null) {
    return {};
  }
  final firestoreData = mapToFirestore(policy.toMap());

  // Add any Firestore field values
  policy.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPolicyListFirestoreData(
  List<PolicyStruct>? policys,
) =>
    policys?.map((e) => getPolicyFirestoreData(e, true)).toList() ?? [];
