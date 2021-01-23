import 'package:basil_hut/widgets/widget.dart';
import 'package:flutter/material.dart';



class PaymentScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController upiController = TextEditingController();
  final int total;

  PaymentScreen(this.total);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Pay Invoice",
                style: inputTextFieldStyle(),
              ),
              Text(
                "Your total : $total",
                style: inputTextFieldStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                  child: ExpansionTile(
                    title: Text('Wallets'),
                    children: [
                      Text('Big Bang'),
                      Text('Birth of the Sun'),
                      Text('Earth is Born'),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                  child: ExpansionTile(
                    title: Text('UPI'),
                    children: [
                      Column(
                        children: [
                          Form(
                            key: formKey,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: upiController,
                                    obscureText: true,
                                    decoration:
                                        inputTextFieldDecoration("UPI ID"),
                                    style: inputTextFieldStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                  child: ExpansionTile(
                    title: Text('Credit/Debit Card'),
                    children: <Widget>[
                      Text('Big Bang'),
                      Text('Birth of the Sun'),
                      Text('Earth is Born'),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                  child: ExpansionTile(
                    title: Text('Net Banking'),
                    children: <Widget>[
                      Text('Big Bang'),
                      Text('Birth of the Sun'),
                      Text('Earth is Born'),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
                  child: ExpansionTile(
                    title: Text('Cash'),
                    children: <Widget>[
                      Text('Big Bang'),
                      Text('Birth of the Sun'),
                      Text('Earth is Born'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
