import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class MaterialButtonToPage extends StatelessWidget {
  final String name;
  final Widget page;

  const MaterialButtonToPage(
      {Key key, @required this.name, @required this.page})
      : super(key: key);

  void _handlerToPage(BuildContext context, Widget child) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => child));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.red,
      child: Text(name),
      onPressed: () => _handlerToPage(context, page),
    );
  }
}
