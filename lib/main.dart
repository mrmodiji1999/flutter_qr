// https://medium.com/@mr.appbuilder/how-to-implement-pagination-in-android-recyclerview-using-retrofit-and-gson-e26761313a48
//  flutter qr code pake flutter pub add qr_flutter
// in index.html
// remove all script in head and body and 
// paste the folllowing in Body
// <script src="main.dart.js" type="application/javascript"></script>
//  paste in starting html tag 
//  <html style="height: 600px; width: 350px">
// //paste in web maifast.json
// {
//     "name": "QR Code Extension",
//     "description": "QR Code Extension",
//     "version": "1.0.0",
//     "content_security_policy": {
//         "extension_pages": "script-src 'self' ; object-src 'self'"
//     },
//     "action": {
//         "default_popup": "index.html",
//         "default_icon": "icons/Icon-192.png"
//     },
//     "manifest_version": 3
// }

// flutter build web
//flutter build web --web-renderer html --csp


import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:QRView()

    );
  }
}


class QRView extends StatefulWidget {
  const QRView({Key? key}) : super(key: key);

  @override
  State<QRView> createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  late final TextEditingController _textController;
  late final FocusNode _textFocus;
  String qrText = '';
  int qrColorIndex = 0;
  int qrBackgroundColorIndex = 0;

  @override
  void initState() {
    _textController = TextEditingController(text: qrText);
    _textFocus = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: QrImageView(
  data: qrText,
  version: QrVersions.auto,
  size: 200.0,
),
          
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _textController,
                      focusNode: _textFocus,
                      decoration: InputDecoration(
                        labelText: 'QR Text',
                        labelStyle: const TextStyle(
                          color: Color(0xFF80919F),
                        ),
                        hintText: 'Enter text / URL',
                        hintStyle: const TextStyle(
                          color: Color(0xFF80919F),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        qrText = value;
                      }),
                    ),
               
                 
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}