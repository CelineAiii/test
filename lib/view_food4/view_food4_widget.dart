import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_food4_model.dart';
export 'view_food4_model.dart';

class ViewFood4Widget extends StatefulWidget {
  const ViewFood4Widget({Key? key}) : super(key: key);

  @override
  _ViewFood4WidgetState createState() => _ViewFood4WidgetState();
}

class _ViewFood4WidgetState extends State<ViewFood4Widget> {
  late ViewFood4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewFood4Model());
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
              FFLocalizations.of(context).getText(
                'fsduh6wp' /* 點心 */,
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
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('nutrient_record');
                        },
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.25,
                            children: [
                              SlidableAction(
                                label: FFLocalizations.of(context).getText(
                                  '2z85pqln' /* Delete */,
                                ),
                                backgroundColor: Color(0xFFF32143),
                                icon: Icons.delete,
                                onPressed: (_) {
                                  print('SlidableActionWidget pressed ...');
                                },
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'h8xzua07' /* 起司漢堡 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    lineHeight: 2.0,
                                  ),
                            ),
                            subtitle: Text(
                              FFLocalizations.of(context).getText(
                                'o6hvvuws' /* 500大卡 */,
                              ),
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                            ),
                            tileColor: Color(0xFFE5E0EB),
                            dense: false,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('nutrient_record');
                        },
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.25,
                            children: [
                              SlidableAction(
                                label: FFLocalizations.of(context).getText(
                                  'sq6izw4v' /* Delete */,
                                ),
                                backgroundColor: Color(0xFFF32143),
                                icon: Icons.delete,
                                onPressed: (_) {
                                  print('SlidableActionWidget pressed ...');
                                },
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'x0d51258' /* 豆漿 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    lineHeight: 2.0,
                                  ),
                            ),
                            subtitle: Text(
                              FFLocalizations.of(context).getText(
                                '4f0ecee0' /* 180大卡 */,
                              ),
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20.0,
                            ),
                            tileColor: Color(0xFFE5E0EB),
                            dense: false,
                          ),
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
