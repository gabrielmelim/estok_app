import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  Widget prefixIcon;
  Widget sullfixIcon;
  String hintText;
  TextInputType keyboardType;
  TextEditingController controller;
  bool obscureText;
  FocusNode focusNode;
  FocusNode requestFocus;
  FormFieldValidator<String> validator;
  int maxLines;
  List<TextInputFormatter> inputFormatters;

  CustomTextFormField({
    this.hintText,
    this.keyboardType = TextInputType.text,
    @required this.controller,
    this.sullfixIcon,
    this.obscureText = false,
    this.prefixIcon,
    this.focusNode,
    this.requestFocus,
    this.maxLines = 0,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: this.maxLines > 0 ? this.maxLines : 1,
          controller: this.controller,
          keyboardType: this.keyboardType,
          focusNode: this.focusNode,
          onFieldSubmitted: (value) {
            if (this.requestFocus != null) {
              FocusScope.of(context).requestFocus(requestFocus);
            }
          },
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
            hintText: this.hintText,
            hintStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700]),
            alignLabelWithHint: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Color.fromRGBO(88, 53, 94, 1),
                  width: 1.0,
                )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.0, color: Color.fromRGBO(88, 53, 94, 1)),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.0, color: Color.fromRGBO(88, 53, 94, 1)),
                borderRadius: BorderRadius.circular(15)),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            prefixIcon: this.prefixIcon,
            suffixIcon: this.sullfixIcon,
          ),
          obscureText: this.obscureText,
          validator: this.validator,
        )
      ],
    );
  }
}
