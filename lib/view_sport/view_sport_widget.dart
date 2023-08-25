import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_sport_model.dart';
export 'view_sport_model.dart';

class ViewSportWidget extends StatefulWidget {
  const ViewSportWidget({Key? key}) : super(key: key);

  @override
  _ViewSportWidgetState createState() => _ViewSportWidgetState();
}

class _ViewSportWidgetState extends State<ViewSportWidget> {
  late ViewSportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewSportModel());
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
        backgroundColor: Color(0xFFF1F4F8),
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
              '今日運動紀錄',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFFE5E0EB),
                    fontSize: 20.0,
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
                  size: 40.0,
                ),
                onPressed: () async {
                  context.pushNamed('sport_record');
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.5,
                          children: [
                            SlidableAction(
                              label: 'Delete',
                              backgroundColor: Color(0xFFF32143),
                              icon: Icons.delete,
                              onPressed: (_) {
                                print('SlidableActionWidget pressed ...');
                              },
                            ),
                            SlidableAction(
                              label: 'Edit',
                              backgroundColor: Color(0xFF858E99),
                              icon: FontAwesomeIcons.tools,
                              onPressed: (_) async {
                                await actions.alertDialogtextField();
                              },
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.swimmer,
                            color: Color(0xFF13112C),
                            size: 25.0,
                          ),
                          title: Text(
                            '游泳 - 800公尺',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  lineHeight: 2.0,
                                ),
                          ),
                          subtitle: Text(
                            '消耗 300 kal',
                            style: FlutterFlowTheme.of(context).titleSmall,
                          ),
                          tileColor: Color(0xFFE5E0EB),
                          dense: false,
                        ),
                      ),
                      Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.5,
                          children: [
                            SlidableAction(
                              label: 'Delete',
                              backgroundColor: Color(0xFFF32143),
                              icon: Icons.delete,
                              onPressed: (_) {
                                print('SlidableActionWidget pressed ...');
                              },
                            ),
                            SlidableAction(
                              label: 'Edit',
                              backgroundColor: Color(0xFF858E99),
                              icon: FontAwesomeIcons.tools,
                              onPressed: (_) async {
                                await actions.alertDialogtextField();
                              },
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.directions_run_rounded,
                            color: Color(0xFF13112C),
                            size: 30.0,
                          ),
                          title: Text(
                            '慢跑 - 30 min',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  lineHeight: 2.0,
                                ),
                          ),
                          subtitle: Text(
                            '消耗 180 kal',
                            style: FlutterFlowTheme.of(context).titleSmall,
                          ),
                          tileColor: Color(0xFFE5E0EB),
                          dense: false,
                        ),
                      ),
                    ],
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
