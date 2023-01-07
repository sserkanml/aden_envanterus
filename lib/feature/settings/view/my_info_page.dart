import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(FontAwesomeIcons.info),
          )
        ],
        title: Text(
          'Bilgilerim',
          style: context.textTheme.headline6,
        ),
      ),
    );
  }
}
