import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class LanguagesDropdown extends StatelessWidget {
  const LanguagesDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/${context.locale.countryCode}.png',
          height: 28,
          width: 40,
          fit: BoxFit.cover,
          frameBuilder: (BuildContext context, Widget widget, _, __) {
            return Container(
              height: null,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: widget,
            );
          },
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButtonFormField(
            hint: const Text('TR_LANGUAGE').tr(),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
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
            },
          ),
        ),
      ],
    );
  }
}
