import 'package:flutter/material.dart';
import 'package:random_color/res/app_colors.dart';
import 'package:random_color/res/app_keys.dart';
import 'package:random_color/res/string_consts.dart';
import 'package:random_color/ui/shared_widgets/insplash_inkwell.dart';
import 'package:random_color/utils/color_generator.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ColorGenerator {
  Color _backgroundColor;
  bool _isDarkBackground;

  @override
  void initState() {
    super.initState();
    _backgroundColor = generateNewColor();
    _isDarkBackground = isColorDark(_backgroundColor);
  }

  void changeColor() {
    setState(() {
      _backgroundColor = generateNewColor();
      _isDarkBackground = isColorDark(_backgroundColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppKeys.kHomeScaffold,
      body: UnsplashInkWell(
        onTap: changeColor,
        key: AppKeys.kBackgroundInkWell,
        child: Center(
          child: Text(
            kHey,
            style: TextStyle(
              color: _isDarkBackground ? AppColors.kWhite : AppColors.kBlack,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      backgroundColor: _backgroundColor,
    );
  }
}
