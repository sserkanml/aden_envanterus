import 'package:flutter/cupertino.dart';
import 'package:kartal/kartal.dart';

class BottomItemWigdet extends StatelessWidget {
  final String label;
  final String path;
  final IconData icon;
  final Color color;
  const BottomItemWigdet(
      {Key? key,
      required this.label,
      required this.path,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 25,
          color: color,
        ),
        Text(
          label,
          style: context.textTheme.bodyMedium!
              .copyWith(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
