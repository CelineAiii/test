import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sport_bike_model.dart';
export 'sport_bike_model.dart';

class SportBikeWidget extends StatefulWidget {
  const SportBikeWidget({Key? key}) : super(key: key);

  @override
  _SportBikeWidgetState createState() => _SportBikeWidgetState();
}

class _SportBikeWidgetState extends State<SportBikeWidget> {
  late SportBikeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SportBikeModel());

    _model.textController ??= TextEditingController();
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: Color(0xFF3C2E92),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Color(0xFFD4D4DC),
                size: 30.0,
              ),
              onPressed: () async {
                context.pushNamed('sport_record');
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                '5ukq3x24' /* Hi! Celine */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontSize: 25.0,
                  ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.15,
                  height: MediaQuery.sizeOf(context).width * 0.15,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/856/600',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
            centerTitle: false,
            toolbarHeight: 70.0,
            elevation: 2.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 20.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '0uz4029u' /* 請在此紀錄您的運動 */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 25.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
              child: FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController ??=
                    FormFieldController<String>(null),
                options: [
                  FFLocalizations.of(context).getText(
                    'bfd3u0mv' /* 一般速度 10km/hr */,
                  ),
                  FFLocalizations.of(context).getText(
                    'ozl288g6' /* 偏快 20km/hr */,
                  ),
                  FFLocalizations.of(context).getText(
                    'z3efqnoo' /* 快速30km/hr */,
                  )
                ],
                onChanged: (val) => setState(() => _model.dropDownValue = val),
                width: 300.0,
                height: 80.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: FFLocalizations.of(context).getText(
                  'f6eghyp5' /* 請選擇運動種類... */,
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 2.0,
                borderColor: Color(0xFFAE99E3),
                borderWidth: 2.0,
                borderRadius: 8.0,
                margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'sapg6yff' /* 此次選擇之運動為： */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                        ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'sab14hpg' /* 跑步 */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
              child: TextFormField(
                controller: _model.textController,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    'inuysxcn' /* 請輸入運動總時數...(單位：分鐘） */,
                  ),
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFAE99E3),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFAE99E3),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '9wthwnco' /* 此次輸入之總時數為： */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                        ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'tyr6g725' /* 30 min */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(-1.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 20.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'vj8eftoh' /* Total: */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFCB5165),
                          fontSize: 30.0,
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '5hci0mxa' /* 本次運動之平均熱量消耗量： */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '4s0f31l4' /* 400 kal */,
                        ),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFCB5165),
                              fontSize: 20.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('加入運動'),
                      content: Text('已加入成功！'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
              },
              text: FFLocalizations.of(context).getText(
                '2tv4s713' /* 加入運動 */,
              ),
              options: FFButtonOptions(
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFAE99E3),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
