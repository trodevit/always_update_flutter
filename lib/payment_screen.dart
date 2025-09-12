// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:uddoktapay/models/credentials.dart';
import 'package:uddoktapay/models/customer_model.dart';
import 'package:uddoktapay/uddoktapay.dart';

class PaymentScreens extends StatefulWidget {
  const PaymentScreens({super.key});

  @override
  State<PaymentScreens> createState() => _PaymentScreensState();
}

class _PaymentScreensState extends State<PaymentScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {
            uddoktapays();
          },
          child: Text(
            'Payment by uddoktapay',
          ),
        ),
      )),
    );
  }

  void uddoktapays() {
    UddoktaPay.createPayment(
      context: context,
      customer: CustomerDetails(
        fullName: 'Programming Wormhole',
        email: 'programmingwormhole@icloud.com',
      ),
      amount: '1',
      credentials: UddoktapayCredentials(
        apiKey: 'f1d5bd54b659a131aad3020f1bbcd15e5bd275d9',
        panelURL: 'https://payment.trocloudbd.com/',
        redirectURL: 'bill.trocloudbd.com',
      ),
    );
  }
}
