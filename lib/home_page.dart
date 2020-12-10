import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/pages/anim_loading_page.dart';
import 'package:flutter_custom_painter/pages/curves_page.dart';
import 'package:flutter_custom_painter/pages/custom_background_page.dart';
import 'package:flutter_custom_painter/pages/tateti_page.dart';
import 'package:flutter_custom_painter/widgets/material_button_to_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Custom Painters'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MaterialButtonToPage(
                  name: 'TA TE TÍ',
                  page: TatetiPage(),
                ),
                MaterialButtonToPage(
                  name: 'CURVES',
                  page: CurvesPage(),
                ),
                MaterialButtonToPage(
                  name: 'ANIMATION LOADING',
                  page: AnimLoadingPage(),
                ),
                MaterialButtonToPage(
                  name: 'CUSTOM BACKGROUND',
                  page: CustomBackgroundPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
