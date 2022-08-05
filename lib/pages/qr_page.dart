import 'package:baggage_validator/pages/verification.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:baggage_validator/utilities/theme_constants.dart';

class QRpage extends StatefulWidget {
  const QRpage({Key? key}) : super(key: key);

  @override
  State<QRpage> createState() => _QRpageState();
}

class _QRpageState extends State<QRpage> {
  final GlobalKey _qrKey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();
  QRViewController? controller;
  Barcode? result;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Alert Dialog
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                cutOutSize: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.amber,
            ),
            child: TextButton(
              onPressed: () async {
                bool isComplete = false;
                if (result != null) {
                  isComplete = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VerificationPage(result!.code!)));
                }
                if (isComplete) {
                  Navigator.pop(context, isComplete);
                }
              },
              child: Text(
                (result != null) ? "Doğrula" : "Taranamadı",
                style: TEXT_THEME_DEFAULT.bodyText1,
              ),
            ),
          )
        ],
      ),
      backgroundColor: COLOR_DARK_BLUE,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        if (scanData.format == BarcodeFormat.qrcode) {
          result = scanData;
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
