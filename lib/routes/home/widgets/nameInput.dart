// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:howoldami/misc/locale.dart';

class NameInput extends StatefulWidget {
  const NameInput({super.key, required this.onSubmitted});
  final Function(String) onSubmitted;

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    debugPrint("focus");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _s = lstr(context)!;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: _focus.hasFocus
            ? Colors.transparent
            : Theme.of(context).colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          hintText: _s.name_task,
          labelText: _s.name_label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
          ),
        ),
        focusNode: _focus,
        // textAlign: TextAlign.center,
      ),
    );
  }
}
