import 'package:aden/core/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dashboard = 'Dashboard';
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [TopSide(dashboard: dashboard)],
        ),
      )),
    );
  }
}

class TopSide extends StatelessWidget {
  const TopSide({
    Key? key,
    required this.dashboard,
  }) : super(key: key);

  final String dashboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: context.colorScheme.onError,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 2,
                    color: context.colorScheme.onSurface.withOpacity(.08),
                  )
                ]),
            child: Center(
              child: Icon(
                Icons.notifications,
                color: context.colorScheme.onSurface.withOpacity(.4),
              ),
            ),
          )
        ],
      ),
    );
  }
}
