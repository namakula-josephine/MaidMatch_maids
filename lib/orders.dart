import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  final String parameter1;
  final int parameter2;

  OrderView({required this.parameter1, required this.parameter2});

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Parameter 1: ${widget.parameter1}'),
            Text('Parameter 2: ${widget.parameter2.toString()}'),
          ],
        ),
      ),
    );
  }
}


