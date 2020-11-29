import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DialogAction { abort, confirm }

class Dialogs {
  static Future<DialogAction> confirmAbortDialog(
      {@required BuildContext context,
      @required String title,
      @required String body,
      String op1,
      String op2}) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              FlatButton(
                  onPressed: () =>
                      Navigator.of(context).pop(DialogAction.abort),
                  child: Text(op2 ??= '')),
              RaisedButton(
                  color: Colors.blue,
                  onPressed: () =>
                      Navigator.of(context).pop(DialogAction.confirm),
                  child: Text(op1 ??= 'Confirmar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          );
        });
    return (action != null) ? action : DialogAction.abort;
  }
}
