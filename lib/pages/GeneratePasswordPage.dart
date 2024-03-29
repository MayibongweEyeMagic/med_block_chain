
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:med_block_chain/pages/HomePage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class GeneratePasswordPage extends StatefulWidget {
  const GeneratePasswordPage({Key? key}) : super(key: key);

  @override
  State<GeneratePasswordPage> createState() => _GeneratePasswordPageState();
}

class _GeneratePasswordPageState extends State<GeneratePasswordPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Future<void> reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
     await controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: _buildQrView(context)
                ),
                // Positioned(child: ,),

              ],
            ),
        );

  }



  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 250.0;

    return QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea),
        // onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p)
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {this.controller = controller;});
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print(result.toString());
      });
    });
  //   Navigator.pushAndRemoveUntil(context,
  //       MaterialPageRoute(builder: (context) => const GeneratePasswordPage()),
  //           (route) => false);
  }
}



