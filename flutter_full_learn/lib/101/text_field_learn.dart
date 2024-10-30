import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
              maxLength: 20,
              buildCounter: (BuildContext context, {required currentLength, required isFocused, required maxLength}) {
                return _animatedContainer(currentLength);
              },
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              inputFormatters: [TextProjectInputFormaatter()._formatter],
              textInputAction: TextInputAction.next, //bunu eklersen sıradaki focusa geçmek için klavyeye next verir
              focusNode: focusNodeTextFieldOne,
              decoration: _InputDecorator().emailInput),
          TextField(
            focusNode: focusNodeTextFieldTwo,
            minLines: 2,
            maxLines: 4,
            style: const TextStyle(color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int currentLength) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.green,
      height: 20,
      width: 10.0 * (currentLength),
      child: const Text(
        'data',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class TextProjectInputFormaatter {
  final _formatter = TextInputFormatter.withFunction(
    (oldValue, newValue) {
      if (newValue.text == 'a') {
        return oldValue;
      }
      return oldValue;
    },
  );
}

class _InputDecorator {
  final emailInput = const InputDecoration(
    prefixIcon: Icon(Icons.mail_rounded),
    border: OutlineInputBorder(),
    hintText: 'hintText',
    labelText: LanguageItems.mailTitle,
    fillColor: Colors.blue,
    filled: true,
  );
}
