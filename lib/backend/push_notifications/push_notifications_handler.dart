import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Kurd_Bills_Splash_Screen.png',
            fit: BoxFit.fill,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'userHome': ParameterData.none(),
  'welcomePage': ParameterData.none(),
  'SignUpPage': ParameterData.none(),
  'ProfilePage': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'LoginSuccessfully': ParameterData.none(),
  'steps': (data) async => ParameterData(
        allParams: {
          'refCategories': await getDocumentParameter<CategoriesRecord>(
              data, 'refCategories', CategoriesRecord.fromSnapshot),
        },
      ),
  'takePic': (data) async => ParameterData(
        allParams: {
          'refCategory': await getDocumentParameter<CategoriesRecord>(
              data, 'refCategory', CategoriesRecord.fromSnapshot),
        },
      ),
  'pendingAndProgress': (data) async => ParameterData(
        allParams: {
          'text1': getParameter<String>(data, 'text1'),
          'text2': getParameter<String>(data, 'text2'),
          'text3': getParameter<String>(data, 'text3'),
          'billRef': await getDocumentParameter<BilllsRecord>(
              data, 'billRef', BilllsRecord.fromSnapshot),
        },
      ),
  'approvedBill': (data) async => ParameterData(
        allParams: {
          'billRef': await getDocumentParameter<BilllsRecord>(
              data, 'billRef', BilllsRecord.fromSnapshot),
        },
      ),
  'sendMoney': (data) async => ParameterData(
        allParams: {
          'billRef': await getDocumentParameter<BilllsRecord>(
              data, 'billRef', BilllsRecord.fromSnapshot),
        },
      ),
  'termsAndServices': ParameterData.none(),
  'userBills': ParameterData.none(),
  'support': ParameterData.none(),
  'AdminBills': ParameterData.none(),
  'AdminHome': ParameterData.none(),
  'blockUsers': ParameterData.none(),
  'userBlocked': ParameterData.none(),
  'LoginPage': ParameterData.none(),
  'forgotPassword': ParameterData.none(),
  'billTransfer': ParameterData.none(),
  'FinancialReport': ParameterData.none(),
  'declineBillPage': (data) async => ParameterData(
        allParams: {
          'billData': await getDocumentParameter<BilllsRecord>(
              data, 'billData', BilllsRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
