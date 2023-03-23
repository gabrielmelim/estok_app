import 'package:flutter/material.dart';

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

  CustomTextFormField({
    @required this.hintText,
    this.keyboardType = TextInputType.text,
    @required this.controller,
    this.sullfixIcon,
    this.obscureText = false,
    this.prefixIcon,
    this.focusNode,
    this.requestFocus,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      keyboardType: this.keyboardType,
      focusNode: this.focusNode,
      onFieldSubmitted: (value){
        if(this.requestFocus != null){
          FocusScope.of(context).requestFocus(requestFocus);
        }
      },
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
           )
       ),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(88, 53, 94, 1)),
            borderRadius: BorderRadius.circular(15)
        ),

        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Color.fromRGBO(88, 53, 94, 1)),
            borderRadius: BorderRadius.circular(15)
        ),

        contentPadding: EdgeInsets.only(
          top: 14.5,
        ),
        prefixIcon: this.prefixIcon,
        suffixIcon: this.sullfixIcon,
      ),
      obscureText: this.obscureText,
      validator: this.validator,
    );
  }
}


