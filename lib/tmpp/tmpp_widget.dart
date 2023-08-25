import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tmpp_model.dart';
export 'tmpp_model.dart';

class TmppWidget extends StatefulWidget {
  const TmppWidget({Key? key}) : super(key: key);

  @override
  _TmppWidgetState createState() => _TmppWidgetState();
}

class _TmppWidgetState extends State<TmppWidget> {
  late TmppModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TmppModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              '5kkiqovi' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'laqy3sj5' /* Thanks for taking the quiz. */,
              ),
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFFAE99E3),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
