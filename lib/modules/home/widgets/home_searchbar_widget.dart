import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Tìm kiếm trên T&T Alarm",
          hintStyle: TextStyle(fontSize: 14.0),
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}
