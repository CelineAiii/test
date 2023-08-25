import '/components/choose_detect_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_costumize_model.dart';
export 'food_costumize_model.dart';

class FoodCostumizeWidget extends StatefulWidget {
  const FoodCostumizeWidget({
    Key? key,
    this.name,
  }) : super(key: key);

  final bool? name;

  @override
  _FoodCostumizeWidgetState createState() => _FoodCostumizeWidgetState();
}

class _FoodCostumizeWidgetState extends State<FoodCostumizeWidget> {
  late FoodCostumizeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodCostumizeModel());
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
      appBar: AppBar(
        backgroundColor: Color(0xFF3C2E92),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 48.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.safePop();
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 48.0,
              icon: Icon(
                Icons.photo_camera,
                color: Color(0xFFFAF7F7),
                size: 30.0,
              ),
              onPressed: () async {
                await requestPermission(photoLibraryPermission);
                await requestPermission(cameraPermission);
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ChooseDetectWidget(
                        name: widget.name!.toString(),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));

                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  setState(() => _model.isDataUploading = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  try {
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                        .toList();
                  } finally {
                    _model.isDataUploading = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length) {
                    setState(() {
                      _model.uploadedLocalFile = selectedUploadedFiles.first;
                    });
                  } else {
                    setState(() {});
                    return;
                  }
                }

                context.pushNamed(
                  'photo_response',
                  queryParameters: {
                    'response': serializeParam(
                      _model.uploadedLocalFile,
                      ParamType.FFUploadedFile,
                    ),
                  }.withoutNulls,
                );
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.pop(context);
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'p8rxl97z' /* 快速加入食品 */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF14181B),
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
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
