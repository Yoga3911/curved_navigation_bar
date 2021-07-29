import 'package:coba/home.dart';
import 'package:flutter/material.dart';

void alertDialFail(BuildContext context) {
  var alertDialog = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    title: Text('Perhatian'),
    content: Text('Username atau Password salah'),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok'))
    ],
  );
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alertDialog;
      });
}

void alertDialSuccess(BuildContext context, String info) {
  var alertDialog = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    title: Text('Perhatian'),
    content: Text('Selamat Datang $info'),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text('Ok'))
    ],
  );
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
