import 'dart:math';
import 'package:flutter/cupertino.dart';

var darkThemeEnabled = false;

String returnThemeMode()
{
  if(darkThemeEnabled)
  {
    return 'Light Mode';
  }
  return 'Dark Mode';
}

Widget themeButton()
{
  return 
    Text(
      returnThemeMode(),
      style: TextStyle(
        fontFamily: 'Garamond'
      ),
    );
}

var _opacity = 1.0;
var color1 = Color.fromRGBO(197, 162, 142, _opacity);
var color2 = Color.fromRGBO(179, 137, 113, _opacity);
var color3 = Color.fromRGBO(205, 146, 112, _opacity);
var color4 = Color.fromRGBO(187, 125, 88, _opacity);
var color5 = Color.fromRGBO(166, 169, 152, _opacity);
var color6 = Color.fromRGBO(170, 175, 143, _opacity);
var color7 = Color.fromRGBO(152, 159, 118, _opacity);
var color8 = Color.fromRGBO(112, 118, 84, _opacity);
var color9 = Color.fromRGBO(203, 194, 185, _opacity);
var color10 = Color.fromRGBO(176, 167, 162, _opacity);
var color11 = Color.fromRGBO(157, 147, 137, _opacity);
var color12 = Color.fromRGBO(144, 132, 120, _opacity);

List<Color> colorList = [color1, color2, color3, color4, color5, color6, color7, color8, color9, color10, color11, color12];

Color randomizeColor()
{
  var _random = Random().nextInt(12);
  return colorList[_random];
}

