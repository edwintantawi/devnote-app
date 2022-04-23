import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:devnote/components/TextEditor.dart';
import 'package:devnote/components/app_shell.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:devnote/components/app_text.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({Key? key}) : super(key: key);

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final TextEditingController _inputTitleController = TextEditingController();
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: const AppText(text: 'TR_CREATE_NOTE'),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _inputTitleController,
                    decoration: InputDecoration(
                      hintText: 'TR_TITLE'.tr(),
                      border: InputBorder.none,
                    ),
                  ),
                  TextField(
                    controller: _inputTitleController,
                    decoration: InputDecoration(
                      hintText: 'TR_DESCRIPTION'.tr(),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: const TextEditor())
          ],
        ),
      ),
    );
  }
}
