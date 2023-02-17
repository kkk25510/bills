// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

SizedBox getSizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

TextStyle getTextstyle(double size) {
  return TextStyle(fontSize: size);
}

OutlineInputBorder getOutlineInputBorder(
    double width, Color colors, double radius) {
  return OutlineInputBorder(
      borderSide: BorderSide(width: width, color: colors),
      borderRadius: BorderRadius.circular(radius));
}

int unitdiff(int current, int previous) {
  int diff;
  diff = current - previous;
  return diff;
}

int Calbill(int diff, int unit) {
  int bill;
  bill = (diff * unit);
  return bill;
}

int TotalBill(int waterbill, int elecbill) {
  int bill;
  bill = waterbill + elecbill;
  return bill;
}

Padding paddingfortable(var text, double size) {
  return Padding(
    padding: const EdgeInsets.all(6),
    child: Center(
        child: Text(
      text,
      style: getTextstyle(size),
    )),
  );
}
