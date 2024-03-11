import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tailwind_colors/flutter_tailwind_colors.dart';
import 'package:styled_widget/styled_widget.dart';

class MyEditableTextWidget extends HookWidget {
  MyEditableTextWidget({
    super.key,
    required this.placeholder,
    required this.placeholderStyle,
    required this.style,
    required this.textController,
  });

  final String placeholder;
  final TextStyle placeholderStyle;
  final TextStyle style;
  final TextEditingController textController;
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final canShowPlaceholder = useState(textController.text.isEmpty);

    void changeCanShowPlaceholder() =>
        canShowPlaceholder.value = textController.text.isEmpty;
    void resetSelectionOffset() => textController.selection =
        const TextSelection(baseOffset: 0, extentOffset: 0);

    return <Widget>[
      if (canShowPlaceholder.value) Text(placeholder, style: placeholderStyle),
      EditableText(
        controller: textController,
        focusNode: _focusNode,
        style: style,
        cursorColor: TWColors.blue.shade300,
        backgroundCursorColor: TWColors.blue,
        selectionControls: MaterialTextSelectionControls(),
        selectionColor: TWColors.blue.shade300,
        showSelectionHandles: true,
        maxLines: null,
        expands: true,
        enableSuggestions: true,
        enableInteractiveSelection: true,
        enableIMEPersonalizedLearning: true,
        onTapOutside: (_) {
          _focusNode.unfocus();
          resetSelectionOffset();
          changeCanShowPlaceholder();
        },
        onChanged: (_) {
          changeCanShowPlaceholder();
        },
      ),
    ].toStack();
  }
}
