import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:devnote/components/app_shell.dart';
import 'package:devnote/components/color_scheme_radio.dart';
import 'package:devnote/components/languages_dropdown.dart';
import 'package:devnote/components/section.dart';
import 'package:devnote/providers/ui_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);

    return AppShell(
      title: const Text('TR_SETTINGS').tr(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Section(
              title: 'TR_COLOR_SCHEME.TITLE'.tr(),
              child: Column(
                children:
                    uiProvider.colorSchemaList.mapIndexed((index, colorScheme) {
                  return ColorSchemeRadio(
                    color: colorScheme.color,
                    name: colorScheme.name.tr(),
                    index: index,
                    currentIndex: uiProvider.colorSchemeIndex,
                    onChange: (newValue) => {
                      uiProvider.setColorSchemeIndex(newValue),
                    },
                  );
                }).toList(),
              ),
            ),
            Section(
              title: 'TR_LANGUAGE'.tr(),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: LanguagesDropdown(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
