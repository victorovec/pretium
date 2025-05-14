import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text('Transactions'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/no_transaction.png', height: 50),
            Text(
              'No recent transactions',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF717274),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}