import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:easy_localization/easy_localization.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({Key? key}) : super(key: key);

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  final QuillController _controller = QuillController.basic();

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 15,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: QuillEditor(
              controller: _controller,
              scrollController: ScrollController(),
              scrollable: true,
              focusNode: _focusNode,
              autoFocus: false,
              readOnly: false,
              placeholder: 'Add content',
              expands: false,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        Container(
          child: QuillToolbar.basic(
            toolbarIconSize: 22,
            locale: context.locale,
            controller: _controller,
            showImageButton: false,
            showVideoButton: false,
            showCameraButton: false,
            showDividers: true,
            multiRowsDisplay: false,
          ),
        ),
      ],
    );
    // );
    // return Column(
    //   children: [
    //     QuillToolbar.basic(
    //       controller: _controller,
    //       showImageButton: false,
    //       showVideoButton: false,
    //       showCameraButton: false,
    //       showDividers: false,
    //       multiRowsDisplay: false,
    //     ),
    // QuillEditor(
    //   controller: _controller,
    //   scrollController: ScrollController(),
    //   scrollable: true,
    //   focusNode: _focusNode,
    //   autoFocus: false,
    //   readOnly: false,
    //   placeholder: 'Add content',
    //   expands: false,
    //   padding: EdgeInsets.zero,
    // ),
    //   ],
    // );
  }
}
