import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Rotate on Widget {
  Widget handleRotation() {
    return RotatedBox(
      quarterTurns: 4,
      child: this,
    );
  }
}

extension EmptySpace on num {
  SizedBox get vertical => SizedBox(height: toDouble().h);
  SizedBox get horizontal => SizedBox(width: toDouble().w);
}
extension Paddings on num {
  EdgeInsets get l => EdgeInsets.only(left: toDouble());
  EdgeInsets get r => EdgeInsets.only(right: toDouble());
  EdgeInsets get t => EdgeInsets.only(top: toDouble());
  EdgeInsets get b => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get all => EdgeInsets.all(toDouble());
}

extension RadiusExt on num {
  BorderRadius get radiusAll => BorderRadius.all(Radius.circular(toDouble()));
  BorderRadius get radiusTLTR => BorderRadius.only(topLeft: Radius.circular(toDouble()), topRight: Radius.circular(toDouble()));
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension ImageAssetExt on String {

  Image get toAsset24 {
    return Image.asset(
      toString(),
      width: 24.w,
      height: 24.h,
    );
  }

  Image get toAsset16 {
    return Image.asset(
      toString(),
      width: 16.w,
      height: 16.h,
    );
  }
  Image get toAsset20 {
    return Image.asset(
      toString(),
      width: 20,
      height: 20,
    );
  }

  Image toAsset({required double w, required double h,BoxFit? fit, Color? color}) => Image.asset(
    toString(),
    width: w,
    height: h,
    color: color,
    fit: fit,
  );
}