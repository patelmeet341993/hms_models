import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerDialog extends StatelessWidget {
  const QRScannerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 500,
        width: 500,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: MobileScanner(
                allowDuplicates: false,
                controller: MobileScannerController(facing: CameraFacing.front, torchEnabled: true),
                onDetect: (Barcode barcode, MobileScannerArguments? args) {
                  if (barcode.rawValue == null) {
                    debugPrint('Failed to scan Barcode');
                  }
                  else {
                    final String code = barcode.rawValue!;
                    debugPrint('Barcode found! $code');
                    if(code.isNotEmpty) {
                      Navigator.pop(context,code);
                    }
                  }
                },
              ),
            ),
            Lottie.asset('assets/lotties/scan.json',),
            Positioned(
              top: 0,
              right: 20,
              child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close,color: Colors.black,size: 18,)),
            ),

          ],
        ),
      ),
    );
  }
}


