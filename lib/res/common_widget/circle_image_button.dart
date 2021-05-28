import 'package:flutter/material.dart';

class CircleImageButton extends StatelessWidget {
  final ImageProvider image;
  final Color? borderColor;
  final double? borderWidth;
  final double? size;
  final VoidCallback? onTap;

  const CircleImageButton({
    Key? key,
    required this.image,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
    this.size = 20,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.all(this.borderWidth ?? 0),
        decoration:
            BoxDecoration(color: this.borderColor, shape: BoxShape.circle),
        child: CircleAvatar(radius: this.size, backgroundImage: this.image),
      ),
    );
  }
}
