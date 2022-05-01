import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

mixin Mensagem {
  void showMensagem(String msg, BuildContext context,
      {int? duration, int? gravity}) {
    ToastContext().init(context);
    Toast.show(msg,
        duration: duration ?? Toast.lengthLong,
        gravity: gravity ?? Toast.bottom,
        backgroundColor: Colors.orangeAccent);
  }
}
