import 'package:flutter/material.dart';
import 'package:greatedays/src/provider/chat/chat_provider.dart';
import 'package:provider/provider.dart';

class BottomKeyboardSheet extends StatefulWidget {
  final String subtitle;

  const BottomKeyboardSheet(this.subtitle, {super.key});

  @override
  State<BottomKeyboardSheet> createState() => _BottomKeyboardSheetState();
}

class _BottomKeyboardSheetState extends State<BottomKeyboardSheet> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void submitMessage(String? msg) {
    if (msg!.isNotEmpty) {
      context.read<ChatProvider>().input(msg);
      _formKey.currentState!.reset();
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: IconButton(
              onPressed: () => print('Icon Tap !'),
              icon: const Icon(Icons.keyboard_control_rounded),
            ),
          ),

          //
          Expanded(
            child: Form(
              key: _formKey,
              child: TextFormField(
                onTap: () {},
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      final formKeyState = _formKey.currentState!;
                      if (formKeyState.validate()) {
                        formKeyState.save();
                      }
                    },
                    icon: const Icon(Icons.send),
                  ),
                  hintText: "Enter ${widget.subtitle}",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  return value!.isEmpty ? "Please Enter some text" : null;
                },
                onSaved: (newValue) => submitMessage(newValue),
                onFieldSubmitted: (value) => submitMessage(value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
