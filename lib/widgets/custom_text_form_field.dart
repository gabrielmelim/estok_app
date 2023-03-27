import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String labelText;
  String hintText;
  TextInputType keyboardType;
  bool obscureText;
  TextEditingController controller;
  FocusNode focusNode;
  FocusNode requestFocus;
  FormFieldValidator<String> validator;
  Icon icon;
  int maxLines=1;
  double inputWidth;





  // O validator recebe a string como parâmetro, se você retornar null, quer dizer que está correto, caso retorne erro

  CustomTextFormField({
     this.controller,
    this.labelText,
     this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.focusNode,
    this.requestFocus,
    this.validator,
    this.icon,
    this.maxLines=1,
    this.inputWidth,



  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  IconData iconData;
  bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.inputWidth,
        child: TextFormField(
          maxLines: widget.maxLines,
          controller: this.widget.controller,
          focusNode: this.widget.focusNode,
          onFieldSubmitted: (value) {
            if (this.widget.requestFocus != null) {
              FocusScope.of(context).requestFocus(widget.requestFocus);
            }
          },
          keyboardType: this.widget.keyboardType,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,

              labelText: this.widget.labelText, labelStyle: TextStyle(color: Color.fromRGBO(192, 182, 182, 1.0),
          fontSize: 12),

              hintText: this.widget.hintText,
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(73, 80, 87, 1.0),

              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide( color: Color.fromRGBO(85, 53, 94, 1.0)),
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon:
                widget.icon != null ?  widget.icon : SizedBox()
              ,

              suffixIcon: this.widget.hintText == "Senha"
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      child: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        size: 24,
                      ),
                    )
                  : null,
              alignLabelWithHint: true),
          obscureText: _isObscure,
          validator: this.widget.validator,
        ),
      );

  }
}
