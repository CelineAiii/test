import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_weekend_model.dart';
export 'food_weekend_model.dart';

class FoodWeekendWidget extends StatefulWidget {
  const FoodWeekendWidget({
    Key? key,
    this.date,
  }) : super(key: key);

  final DateTime? date;

  @override
  _FoodWeekendWidgetState createState() => _FoodWeekendWidgetState();
}

class _FoodWeekendWidgetState extends State<FoodWeekendWidget> {
  late FoodWeekendModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodWeekendModel());
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
              borderColor: Color(0xFF3C2E92),
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              fillColor: Color(0xFF3C2E92),
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Color(0xFFE5E0EB),
                size: 30.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'q2dh7v1d' /* 晚餐 */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFFE5E0EB),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 80.0,
                icon: Icon(
                  Icons.add,
                  color: Color(0xFFE5E0EB),
                  size: 45.0,
                ),
                onPressed: () async {
                  context.pushNamed('food');
                },
              ),
            ],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowCalendar(
                  color: Color(0xFFBEB1DA),
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  weekFormat: true,
                  weekStartsMonday: false,
                  initialDate: widget.date,
                  rowHeight: 64.0,
                  onChange: (DateTimeRange? newSelectedDate) {
                    setState(
                        () => _model.calendarSelectedDay = newSelectedDate);
                  },
                  titleStyle:
                      FlutterFlowTheme.of(context).headlineSmall.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF0D0F10),
                          ),
                  dayOfWeekStyle:
                      FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF0D0F10),
                          ),
                  dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF0D0F10),
                      ),
                  selectedDateStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF0D0F10),
                          ),
                  inactiveDateStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF858E99),
                          ),
                  locale: FFLocalizations.of(context).languageCode,
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0xFFAE99E3),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 8.0, 15.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'i2vxvfju' /* Hello World */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'udhrjkq1' /* Hello World */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
