import 'package:country_picker_bkb/model/country_model.dart';
import 'package:country_picker_bkb/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../country_picker_bkb.dart';

class Country extends StatefulWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final Color? color;
  final Decoration? decoration;

  const Country(
      {Key? key,
      this.child,
      this.decoration,
      this.height,
      this.width,
      this.padding,
      this.color})
      : super(key: key);

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  late GlobalKey _key;
  late Size buttonSize;
  late Offset buttonPosition;

  ValueNotifier<CountryModel> country = ValueNotifier(CountryModel());

  @override
  void initState() {
    loadCountryData();
    loadStateData();
    loadCityData();
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        findButton();
        countrySelect(context, buttonPosition, buttonSize, country);
      },
      child: widget.child ??
          Container(
            key: _key,
            padding: widget.padding ?? const EdgeInsets.all(10),
            height: widget.height ?? 50,
            width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
            decoration: widget.decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.color ?? Colors.white,
                ),
            child: ValueListenableBuilder(
                valueListenable: selectedDetailsForCountry,
                builder: (context, CountryModel selectedCountry, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectedCountry.name ?? "Select Country"),
                      SvgPicture.asset(
                        "packages/country_picker_bkb/lib/assets/svg/down-arrow.svg",
                        height: 15,
                        width: 10,
                      ),
                    ],
                  );
                }),
          ),
    );
  }
}
