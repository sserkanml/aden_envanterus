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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopSide(dashboard: dashboard),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TabContainerWidget(controller: tabContainerController),
            ),
            const SizedBox(
              height: 8,
            ),
            lastItem(context),
            Container(
                height: 200,
                color: context.colorScheme.background,
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return const SizedBox(
                      width: 170,
                      child: Card(
                        elevation: 1,
                        margin: EdgeInsets.only(right: 10),
                      ),
                    );
                  },
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                )),
            reports(context),
            Container(
                color: context.colorScheme.background,
                height: 200,
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return const SizedBox(
                      width: 170,
                      child: Card(
                        elevation: 1,
                        margin: EdgeInsets.only(right: 10),
                      ),
                    );
                  },
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                ))
          ],
        ),
      )),
    );
  }

  Row reports(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Raporlar',
            style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onSurface.withOpacity(.5),
                fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Tümünü Gör",
          ),
        ),
      ],
    );
  }

  Row lastItem(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Son Eklenen Malzemeler',
            style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onSurface.withOpacity(.5),
                fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Tümünü Gör",
          ),
        ),
      ],
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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: context.colorScheme.onSurface.withOpacity(.4),
            ),
          ),
        ],
      ),
    );
  }
}
