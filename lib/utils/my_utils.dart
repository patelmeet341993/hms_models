import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hms_models/models/qr_code/qr_code_data_model.dart';
import 'package:uuid/uuid.dart';

import 'package:hms_models/hms_models.dart' show MyPrint, MyToast, ParsingHelper;

import '../view/components/qr_scanner_dialog.dart';

class MyUtils {
  static Future<void> copyToClipboard(BuildContext? context, String string) async {
    if(string.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: string));
      if(context != null) {
        MyToast.showSuccess(context: context, msg: "Copied");
      }
    }
  }

  String getSecureUrl(String url) {
    if(url.startsWith("http:")) {
      url = url.replaceFirst("http:", "https:");
    }
    return url;
  }

  static String getUniqueIdFromUuid() {
    return const Uuid().v1().replaceAll("-", "");
  }

  static String encodeJson(Object? object) {
    try {
      return jsonEncode(object);
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in MyUtils.encodeJson():$e");
      MyPrint.printOnConsole(s);
      return "";
    }
  }

  static dynamic decodeJson(String body) {
    try {
      return jsonDecode(body);
    }
    catch(e, s) {
      MyPrint.printOnConsole("Error in MyUtils.decodeJson():$e");
      MyPrint.printOnConsole(s);
      return null;
    }
  }

  static Future<String> scanQRAndGetRawData({required BuildContext context}) async {
    dynamic value = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const QRScannerDialog();
      },
    );

    String data = ParsingHelper.parseStringMethod(value);

    return data;
  }

  static Future<QRCodeDataModel> scanQRAndGetQRCodeDataModel({required BuildContext context}) async {
    dynamic value = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const QRScannerDialog();
      },
    );

    String data = ParsingHelper.parseStringMethod(value);
    QRCodeDataModel qrCodeDataModel = QRCodeDataModel.fromEncodedString(data);

    return qrCodeDataModel;
  }
}













