import 'package:aden/feature/customers/controller/customer_service.dart';
import 'package:aden/feature/projects/model/project.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_input_chips/flutter_input_chips.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kartal/kartal.dart';

class ProjectDetail extends StatefulWidget {
  final Project project;
  const ProjectDetail({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  late TextEditingController projectNameController;
  late TextEditingController noteController;
  late List<String> inputChild;
  @override
  void initState() {
    projectNameController = TextEditingController();
    noteController = TextEditingController();
    projectNameController.text = widget.project.projeAdi ?? " ";
    inputChild = widget.project.etiket.isNullOrEmpty
        ? []
        : widget.project.etiket!.split(",");
    noteController.text = widget.project.projeNot ?? " ";
    super.initState();
  }

  double gap = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Proje Detay',
          style: context.textTheme.headline6!.copyWith(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                const Spacer(),
                Modular.get<CustomerService>()
                            .customers
                            .firstWhereOrNull((element) =>
                                element.oid == widget.project.musteriID)
                            ?.musteriFirmaAdi ==
                        null
                    ? ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Firma Ata",
                        ),
                      )
                    : Text(
                        "Projeye Atanan Firma:${Modular.get<CustomerService>().customers.firstWhereOrNull((element) => element.oid == widget.project.musteriID)!.musteriFirmaAdi!}",
                        style: context.textTheme.bodyLarge,
                      ),
              ],
            ),
            SizedBox(
              height: gap,
            ),
            SizedBox(
              height: 200,
              width: context.dynamicWidth(1),
              child: widget.project.projeResim.isNullOrEmpty
                  ? DottedBorder(
                      strokeWidth: 2,
                      color: context.colorScheme.onSurface.withOpacity(.4),
                      dashPattern: const [6, 6],
                      child: SizedBox(
                        width: context.dynamicWidth(1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Resim Bulunamadı',
                              style: context.textTheme.bodyLarge!.copyWith(
                                  color: context.colorScheme.onSurface
                                      .withOpacity(.7)),
                            )
                          ],
                        ),
                      ))
                  : Image.network(
                      "http://envanter.sgktesvikrehberi.com/Content/Upload/${widget.project.projeResim}",
                      width: context.dynamicWidth(1),
                      height: 200,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              height: gap,
            ),
            TextFormField(
              controller: projectNameController,
              onFieldSubmitted: (value) {},
              decoration: const InputDecoration(
                  labelText: "Proje Adı",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: gap,
            ),
            TextFormField(
              controller: noteController,
              maxLines: 6,
              onFieldSubmitted: (value) {},
              decoration: const InputDecoration(
                  labelText: "Proje Not",
                  hintText: "Proje Not",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: gap,
            ),
            tagChip(context),
            SizedBox(
              height: gap,
            ),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Düzenle",
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  FlutterInputChips tagChip(BuildContext context) {
    return FlutterInputChips(
      maxChips: 4,
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      chipBackgroundColor: context.colorScheme.primary,
      chipSpacing: 10,
      initialValue: inputChild,
      chipDeleteIcon: const Icon(Icons.close),
      chipDeleteIconColor: Colors.white,
      chipTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      inputDecoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Etiket",
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          )),
      onChanged: (value) {
        setState(() {
          inputChild = value;
        });
      },
    );
  }
}
