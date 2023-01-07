import 'package:aden/core/util/utils.dart';
import 'package:aden/feature/root/widget/tab_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tab_container/tab_container.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late TabContainerController tabContainerController;
  @override
  void initState() {
    tabContainerController = TabContainerController(length: 4);
    super.initState();
  }

  @override
  void dispose() {
    tabContainerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dashboard = 'Dashboard';
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            TopSide(dashboard: dashboard),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TabContainerWidget(controller: tabContainerController),
            )
          ],
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
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Image.asset(
                context.getPath(folder: "images", file: "envanterPure.png"),
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Envanterus',
                style: GoogleFonts.kalam(
                    fontSize: 28,
                    color: context.colorScheme.onSurface.withOpacity(.5)),
              ),
            ],
          ),
          // Container(
          //   height: 50,
          //   width: 50,
          //   decoration: BoxDecoration(
          //       color: const Color(0xFFFFB59D),
          //       borderRadius: BorderRadius.circular(6),
          //       boxShadow: [
          //         BoxShadow(
          //           blurRadius: 3,
          //           spreadRadius: 2,
          //           color: context.colorScheme.onBackground.withOpacity(.08),
          //         )
          //       ]),
          //   child: const Center(
          //     child: Icon(
          //       Icons.notifications,
          //       size: 30,
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
