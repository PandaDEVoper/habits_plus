import 'package:flutter/material.dart';

import '../../../localization.dart';

class StartTextField extends StatefulWidget {
  Function onSaved;
  String errorLocalizationPath;
  String labelLocalizationPath;
  Function validator;
  bool hasObscure = false;
  IconData prefix;

  StartTextField({
    this.onSaved,
    this.errorLocalizationPath,
    this.labelLocalizationPath,
    this.hasObscure,
    this.validator,
    this.prefix,
  }) {
    if (hasObscure == null) hasObscure = false;
  }

  @override
  _StartTextFieldState createState() => _StartTextFieldState();
}

class _StartTextFieldState extends State<StartTextField> {
  String _submit(String value) {
    return value == '' && widget.errorLocalizationPath != null
        ? AppLocalizations.of(context).translate(
            widget.errorLocalizationPath,
          )
        : null;
  }

  @override
  void initState() {
    super.initState();
    if (widget.validator == null) {
      widget.validator = _submit;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0x11000000),
      ),
      margin: EdgeInsets.symmetric(horizontal: 28),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black87,
        ),
        obscureText: widget.hasObscure,
        validator: widget.validator,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          prefixIcon: widget.prefix != null
              ? Icon(
                  widget.prefix,
                  color: Theme.of(context).disabledColor,
                )
              : null,
          labelStyle: TextStyle(
            color: Colors.black38,
          ),
          labelText: AppLocalizations.of(context).translate(
            widget.labelLocalizationPath,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}