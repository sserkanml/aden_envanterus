import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:line_icons/line_icons.dart';

class ChekcsPage extends StatelessWidget {
  const ChekcsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [Padding(
          padding: EdgeInsets.only(right:14.0),
          child: Icon(LineIcons.archive,size: 30,),
        )],
        title: Text(
          'Sayımlar',
          style: context.textTheme.headline6!.copyWith(),
        ),
      ),
    );
  }
}
