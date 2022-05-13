import 'package:flutter/material.dart';
import 'package:testpayment/services/payment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StripeServices.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaymentTest'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  paynow();
                },
                child: Text('Pay Order')),
          ],
        ),
      ),
    );
  }

  paynow() async {
   var response =  await StripeServices.payNowHandler(amount: '2000', currency: 'USD');
     print('response message ${response.message}');
  }
}
