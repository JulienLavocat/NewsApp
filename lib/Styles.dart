import "package:flutter/material.dart";
import "package:flutter_custom_tabs/flutter_custom_tabs.dart";

class Styles {

    static const FONT_TITLE = TextStyle(fontSize: 18.0);
    static const TABS_OPTIONS = CustomTabsOption(
        toolbarColor: Colors.blue,
        enableDefaultShare: true,
        enableUrlBarHiding: true,
        showPageTitle: true,
        animation: const CustomTabsAnimation(
            startEnter: 'slide_up',
            startExit: 'android:anim/fade_out',
            endEnter: 'android:anim/fade_in',
            endExit: 'slide_down',
          ),
    );
}