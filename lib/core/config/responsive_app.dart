import 'package:responsive_framework/responsive_wrapper.dart';

class MyResponsiveApp {
  static responsiveSetup(widget) {
    return ResponsiveWrapper.builder(
      widget,
      maxWidth: 2460,
      minWidth: 450,
      defaultScale: true,
      breakpoints: [
        const ResponsiveBreakpoint.resize(450, name: MOBILE),
        const ResponsiveBreakpoint.autoScale(800, name: TABLET),
        const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
      ],
    );
  }
}