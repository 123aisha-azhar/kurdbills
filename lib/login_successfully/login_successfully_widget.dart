import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_successfully_model.dart';
export 'login_successfully_model.dart';

class LoginSuccessfullyWidget extends StatefulWidget {
  const LoginSuccessfullyWidget({super.key});

  static String routeName = 'LoginSuccessfully';
  static String routePath = '/loginSuccessfully';

  @override
  State<LoginSuccessfullyWidget> createState() =>
      _LoginSuccessfullyWidgetState();
}

class _LoginSuccessfullyWidgetState extends State<LoginSuccessfullyWidget> {
  late LoginSuccessfullyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginSuccessfullyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userCheck =
          await UserRecord.getDocumentOnce(currentUserReference!);
      if (!_model.userCheck!.hasAdmin()) {
        await _model.userCheck!.reference.update(createUserRecordData(
          admin: false,
        ));
      }
      if (!_model.userCheck!.hasIsBlocked()) {
        await _model.userCheck!.reference.update(createUserRecordData(
          isBlocked: false,
        ));
      }
      await actions.delayedNavigation(
        context,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 117.0,
              height: 117.0,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/image_1.png',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
              child: AutoSizeText(
                FFLocalizations.of(context).getText(
                  'nleuac1p' /* You have successfully login */,
                ),
                minFontSize: 18.0,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Color(0xFF38A2FF),
                      fontSize: 23.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'fnwlko3v' /* You will be redirected to the ... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Color(0xFF38A2FF),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
