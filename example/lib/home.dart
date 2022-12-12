import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:country_picker_bkb/utils.dart';
import 'package:country_picker_bkb/widgets/city.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(
        child: CountryPicker(),
      ),
    );
  }
}
