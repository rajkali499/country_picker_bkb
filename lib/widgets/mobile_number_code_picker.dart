import 'package:country_picker_bkb/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../country_picker_bkb.dart';
import '../utils.dart';

class MobileNumberCode extends StatefulWidget {
  final Color? color;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final String? downArrow;
  final TextEditingController textEditingController;
  final TextInputType? keyBoardType;
  final InputDecoration? textFieldDecoration;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? child;

  const MobileNumberCode({
    Key? key,
    this.color,
    this.decoration,
    this.width,
    this.height,
    this.padding,
    this.downArrow,
    required this.textEditingController,
    this.keyBoardType,
    this.textFieldDecoration,
    this.child,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<MobileNumberCode> createState() => _MobileNumberCodeState();
}

class _MobileNumberCodeState extends State<MobileNumberCode> {
  late GlobalKey _key;
  late Size buttonSize;
  late Offset buttonPosition;

  ValueNotifier<CountryModel> country = ValueNotifier(CountryModel());

  @override
  void initState() {
    // TODO: implement initState
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        key: _key,
        padding: widget.padding ?? const EdgeInsets.all(10),
        height: widget.height ?? 50,
        width: widget.width ?? MediaQuery.of(context).size.width,
        decoration: widget.decoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.color ?? Colors.white,
            ),
        child: ValueListenableBuilder(
          valueListenable: selectedCountryDetailsForPhoneCode,
          builder: (context, CountryModel selectedValue, child) {
            return widget.child ??
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        findButton();
                        phoneCodeSelect(
                            context, buttonPosition, buttonSize, country);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Wrap(
                          spacing: 10,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SvgPicture.asset(
                                flags[selectedValue.code] ?? flags['AF']!,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Text(selectedValue.dialCode ?? "+93"),
                            SvgPicture.asset(
                              widget.downArrow ??
                                  "packages/country_picker_bkb/lib/assets/svg/down-arrow.svg",
                              height: 15,
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: TextFormField(
                        controller: widget.textEditingController,
                        keyboardType:
                            widget.keyBoardType ?? TextInputType.phone,
                        decoration: widget.textFieldDecoration ??
                            const InputDecoration(),
                        onChanged: widget.onChanged ?? (val) {},
                        validator: widget.validator ??
                            (val) {
                              return null;
                            },
                      ),
                    ),
                  ],
                );
          },
        ),
      ),
    );
  }
}
