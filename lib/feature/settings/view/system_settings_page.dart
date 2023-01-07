import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';

class SystemSettingsPage extends StatefulWidget {
  const SystemSettingsPage({Key? key}) : super(key: key);

  @override
  State<SystemSettingsPage> createState() => _SystemSettingsPageState();
}

class _SystemSettingsPageState extends State<SystemSettingsPage> {
  bool isAutoQr = false;
  bool isAutoBarCode = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(FontAwesomeIcons.gear),
          )
        ],
        title: Text(
          'Sistem Ayarları',
          style: context.textTheme.headline6,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Otomatik Qr Oluştur'),
              trailing: GFToggle(
                type: GFToggleType.ios,
                  onChanged: (value) {
                    setState(() {
                      isAutoQr = !isAutoQr;
                    });
                  },
                  value: isAutoQr),
            ),
            Divider(
              height: 1,
              color: context.colorScheme.onSurface.withOpacity(.1),
            ),
            ListTile(
              title: const Text('Otomatik Barcode Oluştur'),
              trailing: GFToggle(
                type: GFToggleType.ios,
                  onChanged: (value) {
                    setState(() {
                      isAutoBarCode = !isAutoBarCode;
                    });
                  },
                  value: isAutoBarCode),
            )
          ],
        ),
      )),
    );
  }
}
