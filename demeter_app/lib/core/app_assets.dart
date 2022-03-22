//logos
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static final avatar = Image.asset('images/avatar.jpeg', fit: BoxFit.fill);
  static final dashboardMenu = SvgPicture.asset("icons/dashboard.svg");
  static final hrMenu = SvgPicture.asset("icons/hr.svg");
  static final refundMenu = SvgPicture.asset("icons/refund.svg");
  static final historicMenu = SvgPicture.asset("icons/clock.svg");
  static final moreMenu = SvgPicture.asset("icons/more.svg");
}
