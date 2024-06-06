import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const autoLocales = true;

final stdLocalizationDelegates = autoLocales
    ? AppLocalizations.localizationsDelegates
    : [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

final supportedLocales = autoLocales
    ? AppLocalizations.supportedLocales
    : [
        const Locale('en', 'US'),
        const Locale('de', 'DE'),
      ];

AppLocalizations? lstr(BuildContext context) => AppLocalizations.of(context);
