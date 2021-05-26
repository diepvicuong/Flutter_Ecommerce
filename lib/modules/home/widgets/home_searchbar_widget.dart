import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final double? elevation;
  final double? marginValue;
  final bool isEnable;

  const CustomSearchBar(
      {Key? key,
      this.hintText,
      this.onTap,
      this.onChanged,
      this.elevation,
      this.marginValue,
      this.onFieldSubmitted,
      this.isEnable = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: this.elevation,
      margin: EdgeInsets.all(this.marginValue ?? 0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14.0),
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
        textInputAction: TextInputAction.search,
        enabled: this.isEnable,
        onChanged: this.onChanged,
        onTap: this.onTap,
        onFieldSubmitted: this.onFieldSubmitted,
      ),
    );
  }
}
