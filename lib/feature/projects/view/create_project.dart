import 'dart:io';

import 'package:aden/feature/customers/controller/customer_service.dart';
import 'package:aden/feature/projects/controller/form_project_create.dart';
import 'package:aden/feature/projects/model/post_project.dart';
import 'package:aden/feature/settings/controller/user_service.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_input_chips/flutter_input_chips.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kartal/kartal.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  late FocusNode userNameFocus;
  late SingleValueDropDownController customerDropDown;
  late SingleValueDropDownController userDropDown;
  late MultiImagePickerController imagePickerController;
  String customer = "";
  String member = "";
  PostProject postProjectEmpty = PostProject(
      imageFile: null,
      projectName: "",
      customerId: "",
      memberId: "",
      note: "",
      tags: []);
  PostProject postProjectChanged = PostProject(
      imageFile: null,
      projectName: "",
      customerId: "",
      memberId: "",
      note: "",
      tags: []);
  List<String> tags = [];

  @override
  void initState() {
    customerDropDown = SingleValueDropDownController();
    imagePickerController = MultiImagePickerController(
        maxImages: 1, allowedImageTypes: ["png", "jpeg", "jpg"], images: []);
    userDropDown = SingleValueDropDownController();

    super.initState();
  }

  @override
  void dispose() {
    customerDropDown.dispose();
    userDropDown.dispose();
    super.dispose();
  }

  double gap = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              if (postProjectChanged == postProjectEmpty) {
                Modular.to.pop();
              } else {
                final result = await closeDialog(context);

                if (result!) {
                  Modular.to.pop();
                } else {
                  return;
                }
              }
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            'Proje Oluştur',
            style: context.textTheme.headline6,
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: CreateProjectForm.projectForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pickImage(context),
                SizedBox(
                  height: gap,
                ),
                projectNameField(),
                SizedBox(
                  height: gap,
                ),
                dropdownCustomer(),
                SizedBox(
                  height: gap,
                ),
                dropDownMember(),
                SizedBox(
                  height: gap,
                ),
                noteField(),
                SizedBox(
                  height: gap,
                ),
                tagsChip(context),
                SizedBox(
                  height: gap,
                ),
                saveRow(context)
              ],
            ),
          ),
        )));
  }

  TextFormField projectNameField() {
    return TextFormField(
      onChanged: (value) {
        postProjectChanged.projectName = value;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value.isNotNullOrNoEmpty) {
          return null;
        } else {
          return "Bu alan boş geçilemez";
        }
      },
      onFieldSubmitted: (value) {},
      decoration: const InputDecoration(
          labelText: "Proje Adı",
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          border: OutlineInputBorder()),
    );
  }

  Row saveRow(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            if (CreateProjectForm.projectForm.currentState!.validate()) {
              CreateProjectForm.projectForm.currentState!.save();
            } else {}
          },
          child: Text(
            "Kaydet",
            style: context.textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }

  TextFormField noteField() {
    return TextFormField(
      maxLines: 5,
      onChanged: (value) {
        postProjectChanged.note = value;
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Not Yaz",
          alignLabelWithHint: true,
          labelText: "Not"),
    );
  }

  Future<bool?> closeDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Değişikleri Kaydet',
            style: context.textTheme.bodyMedium,
          ),
          content: Text(
            'Yaptığınız değişikler silinecektir',
            style: context.textTheme.bodyMedium,
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Navigator.pop<bool>(context, false);
              },
              child: Text(
                "İptal Et",
                style: context.textTheme.bodyMedium!
                    .copyWith(color: context.colorScheme.primary),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop<bool>(context, true);
              },
              child: Text(
                "Çıkış Yap",
                style:
                    context.textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  SizedBox pickImage(BuildContext context) {
    return SizedBox(
      height: 200,
      width: context.dynamicWidth(1),
      child: MultiImagePickerView(
        onChange: (p0) {
          postProjectChanged.imageFile = p0.firstOrNull;
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 200, maxCrossAxisExtent: context.dynamicWidth(1)),
        addMoreBuilder: null,
        draggable: false,
        controller: imagePickerController,
        itemBuilder: (context, file, deleteCallback) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                  child: Image.file(
                File(file.path!),
                fit: BoxFit.cover,
              )),
              Positioned(
                top: -10,
                right: -10,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colorScheme.primary),
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Material(
                      color: context.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        onPressed: () {
                          deleteCallback(file);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
        initialContainerBuilder: (context, pickerCallback) {
          return InkWell(
            onTap: () {
              pickerCallback();
            },
            child: dottedAddImage(context),
          );
        },
      ),
    );
  }

  FlutterInputChips tagsChip(BuildContext context) {
    return FlutterInputChips(
      maxChips: 4,
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      chipBackgroundColor: context.colorScheme.primary,
      chipSpacing: 10,
      initialValue: const [],
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
          tags = value;
          postProjectChanged.tags = tags;
        });
      },
    );
  }

  DottedBorder dottedAddImage(BuildContext context) {
    return DottedBorder(
        color: context.colorScheme.onSurface.withOpacity(.4),
        dashPattern: const [6, 6],
        strokeWidth: 2,
        child: SizedBox(
          width: context.dynamicWidth(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.browse_gallery),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Resim Ekle',
                style: context.textTheme.bodyLarge!.copyWith(
                    color: context.colorScheme.onSurface.withOpacity(.5)),
              )
            ],
          ),
        ));
  }

  DropDownTextField dropDownMember() {
    return DropDownTextField(
        listTextStyle:
            context.textTheme.bodyMedium!.copyWith(color: Colors.black),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textFieldDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            hintText: "Kullanıcı Seç",
            labelText: "Kullanıcı Seç"),
        validator: (value) {
          if (value.isNullOrEmpty) {
            return "Bu alan boş geçilemez";
          } else {
            return null;
          }
        },
        onChanged: (value) {
          if (value is DropDownValueModel) {
            postProjectChanged.memberId = value.value;
          } else {
            postProjectChanged.memberId = "";
          }
        },
        dropDownList: [
          ...List.generate(
              Modular.get<CustomerService>().getLength,
              (index) => DropDownValueModel(
                  name: Modular.get<MemberService>().members[index].adiSoyadi ??
                      " ",
                  value: Modular.get<MemberService>().members[index].oid))
        ],
        dropDownItemCount: Modular.get<MemberService>().getLength);
  }

  DropDownTextField dropdownCustomer() {
    return DropDownTextField(
        listTextStyle:
            context.textTheme.bodyMedium!.copyWith(color: Colors.black),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: customerDropDown,
        textFieldDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            hintText: "Müşteri Seç",
            labelText: "Müşteri Seç"),
        validator: (value) {
          if (value.isNullOrEmpty) {
            return "Bu alan boş geçilemez";
          } else {
            return null;
          }
        },
        onChanged: (value) {
          if (value is DropDownValueModel) {
            postProjectChanged.customerId = value.value;
          } else {
            postProjectChanged.customerId = "";
          }
        },
        dropDownList: [
          ...List.generate(
              Modular.get<CustomerService>().getLength,
              (index) => DropDownValueModel(
                  name: Modular.get<CustomerService>()
                          .customers[index]
                          .musteriFirmaAdi ??
                      " ",
                  value: Modular.get<CustomerService>().customers[index].oid))
        ],
        dropDownItemCount: Modular.get<CustomerService>().getLength);
  }
}
