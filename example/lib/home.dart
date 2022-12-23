import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:country_picker_bkb/model/country_model.dart';
import 'package:country_picker_bkb/utils.dart';
import 'package:country_picker_bkb/widgets/city.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   late GlobalKey _key;

   late Size buttonSize;

   late Offset buttonPosition;

   ValueNotifier<Country_Model> country=ValueNotifier(Country_Model());

   @override
  initState(){
     _key = LabeledGlobalKey("button_icon");
     super.initState();
     loadCountryData();
     loadStateData();
     loadCityData();
   }

  findButton() {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SafeArea(
        child: CountryPicker(),
      ),
      );
  }
}
