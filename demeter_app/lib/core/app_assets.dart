//logos
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static final avatar = Image.asset('images/avatar.jpeg', fit: BoxFit.fill);
  static final dashboardMenu = SvgPicture.asset("images/icons/dashboard.svg");
  static final hrMenu = SvgPicture.asset("images/icons/hr.svg");
  static final refundMenu = SvgPicture.asset("images/icons/refund.svg");
  static final historicMenu = SvgPicture.asset("images/icons/clock.svg");
  static final moreMenu = SvgPicture.asset("images/icons/more.svg");
}
