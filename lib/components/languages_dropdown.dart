import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class LanguagesDropdown extends StatelessWidget {
  const LanguagesDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: const Text('TR_LANGUAGE').tr(),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      value: context.locale,
      items: context.supportedLocales.map((language) {
        return DropdownMenuItem(
          child: Text(language.toStringWithSeparator(separator: ' ')),
          value: language,
        );
      }).toList(),
      onChanged: (newValue) {
        context.setLocale(newValue.toString().toLocale());
        // provider.setSelectedItem(newValue as String);
      },
    );
  }
}
