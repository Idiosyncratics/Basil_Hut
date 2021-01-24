import 'package:basil_hut/widgets/widget.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final formKeyWallet = GlobalKey<FormState>();
  final formKeyUPI = GlobalKey<FormState>();
  final formKeyCard = GlobalKey<FormState>();
  final formKeyNetBanking = GlobalKey<FormState>();
  final formKeyCash = GlobalKey<FormState>(); 
  

  TextEditingController upiController = TextEditingController();
  TextEditingController upiReferralController = TextEditingController();

  TextEditingController walletMobileNoController = TextEditingController();
  TextEditingController walletNameController = TextEditingController();
  TextEditingController walletReferralController = TextEditingController();

  TextEditingController cardNoController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();
  TextEditingController cardCvvController = TextEditingController();

  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController netBankingPasswordController = TextEditingController();

  final int total;

  PaymentScreen(this.total);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getGradient(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 150,
                    width: 200,
                    child: Image.asset('images/BasilHutIcon.png')),
                Text(
                  "Pay Invoice",
                  style: pageHeadingTextFieldStyle(),
                ),
                Text(
                  "Your total : ₹ $total",
                  style: inputTextFieldStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.grey[100], //Wallets
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child: ExpansionTile(
                      title: Text('Wallets', style: inputTextFieldStyle(),),
                      children: [
                        Form(
                          key: formKeyWallet,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: walletMobileNoController,
                                  decoration: inputTextFieldDecoration("Mobile No"),
                                  style: inputTextFieldStyle(),
                                ),
                                TextFormField(
                                  controller: walletNameController,
                                  decoration:
                                      inputTextFieldDecoration("Wallet Name"),
                                  style: inputTextFieldStyle(),
                                ),
                                TextFormField(
                                  controller: walletReferralController,
                                  decoration: inputTextFieldDecoration(
                                      "Referral Code (if any)"),
                                  style: inputTextFieldStyle(),
                                ),
                                SizedBox(height: 20)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey[100], //UPI
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child: ExpansionTile(
                      title: Text('UPI', style: inputTextFieldStyle()),
                      children: [
                        Column(
                          children: [
                            Form(
                              key: formKeyUPI,
                              child: Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: upiController,
                                      decoration:
                                          inputTextFieldDecoration("UPI ID"),
                                      style: inputTextFieldStyle(),
                                    ),
                                    TextFormField(
                                      controller: upiReferralController,
                                      decoration: inputTextFieldDecoration(
                                          "Referral Code (if any) "),
                                      style: inputTextFieldStyle(),
                                    ),
                                    SizedBox(height: 20)
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
                  color: Colors.grey[100],//Credit/Debit
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child:
                        ExpansionTile(title: Text('Credit/Debit Card', style: inputTextFieldStyle()), children: [
                      Form(
                        key: formKeyCard,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: cardNoController,
                                decoration: inputTextFieldDecoration("Card No"),
                                style: inputTextFieldStyle(),
                              ),
                              TextFormField(
                                controller: cardExpiryController,
                                decoration:
                                    inputTextFieldDecoration("Expiry Date (mm/yy)"),
                                style: inputTextFieldStyle(),
                              ),
                              TextFormField(
                                controller: cardCvvController,
                                obscureText: true,
                                decoration: inputTextFieldDecoration("CVV"),
                                style: inputTextFieldStyle(),
                              ),
                              SizedBox(height: 20)
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Card(
                  color: Colors.grey[100],//Net Banking
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child: ExpansionTile(
                      title: Text('Net Banking', style: inputTextFieldStyle()),
                      children: [
                        Form(
                          key: formKeyNetBanking,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: bankNameController,
                                  decoration: inputTextFieldDecoration("Bank Name"),
                                  style: inputTextFieldStyle(),
                                ),
                                TextFormField(
                                  controller: accountNoController,
                                  decoration:
                                      inputTextFieldDecoration("Account No"),
                                  style: inputTextFieldStyle(),
                                ),
                                TextFormField(
                                  controller: netBankingPasswordController,
                                  obscureText: true,
                                  decoration: inputTextFieldDecoration("Password"),
                                  style: inputTextFieldStyle(),
                                ),
                                SizedBox(height: 20)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                    child: ExpansionTile(
                      title: Text('Cash', style: inputTextFieldStyle()),
                      children: [
                        Form(
                          key: formKeyCash,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30
                ),
                ButtonTheme(
                  minWidth: 160,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {
                      //TODO Payment Options
                    },
                    child: Text(
                      "Pay Now",
                      style: buttonTextStyle(),
                    ),
                    color: getLogoColor(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
                SizedBox(
                    height: 30
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
