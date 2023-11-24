import 'dart:io';

import 'package:flutter/material.dart';
import 'package:polytech_visits/services/network_service.dart';
import 'package:polytech_visits/widgets/custom_snackbar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewPage extends StatefulWidget {
  const QRViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewPageState();
}

class _QRViewPageState extends State<QRViewPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildQrView(context),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 350 ||
            MediaQuery.of(context).size.height < 350)
        ? 150.0
        : 300.0;

    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: scanArea),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 50),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    if (mounted) {
      setState(() {
        this.controller = controller;
      });
      controller.scannedDataStream.listen((scanData) {
        setState(() {
          result = scanData;
        });
        checkSchedule(result!.code ?? '');
      });
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void checkSchedule(String number) async {
    try {
      controller!.pauseCamera();
      var response = await NetworkService().checkSchedule(number);
      if (response['status'] == 'ok') {
        showCustomSnackBar(context, 'Добро пожаловать.');
        Future.delayed(const Duration(seconds: 1))
            .whenComplete(() => Navigator.of(context).pop());
      } else {
        showCustomSnackBar(context, 'Доступ запрещен.');
        Future.delayed(const Duration(seconds: 1))
            .whenComplete(() => Navigator.of(context).pop());
      }
    } catch (error) {
      showCustomSnackBar(context, error.toString());
      Future.delayed(const Duration(seconds: 1))
          .whenComplete(() => Navigator.of(context).pop());
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
