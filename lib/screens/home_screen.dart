import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretium/data/financial_service_data.dart';
import 'package:pretium/screens/register_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = ref.watch(firstNameProvider);
    final firstName = firstNameController.text;
    print(firstName);
    final hideBalance = ref.watch(hideBalanceProvider);
    return Scaffold(
      backgroundColor: Color(0xFFedf3f3),
      appBar: AppBar(
        backgroundColor: Color(0xFF1b6362),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                firstName == '' ? 'U' : firstName.substring(0, 1),

                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF1b6362),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            firstName == ''
                ? Text(
                  'Hello, User',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                )
                : Text('Hello, $firstName'),
            SizedBox(width: 5),
            SvgPicture.asset('assets/icons/waving-hand.svg', height: 30),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                size: 30,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF175e60), Color(0xFF184f63)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF427f7f),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: Color(0xFFFFFFFF),
                            size: 30,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(hideBalanceProvider.notifier).state =
                                !ref.read(hideBalanceProvider.notifier).state;
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xFF427f7f),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              hideBalance == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    hideBalance == true ? SizedBox():
                    Text(
                      'Wallet Balance',
                      style: TextStyle(
                        color: Color(0xFFafd2d1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    hideBalance == false ? SizedBox(height: 0) :SizedBox(height: 10),
                    hideBalance == true ? Text(
                      'Wallet Balance',
                      style: TextStyle(
                        color: Color(0xFFafd2d1),
                        fontWeight: FontWeight.bold,
                      ),
                    ):
                    Row(
                      children: [
                        Text(
                          'NGN',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        
                        Text(
                          '0.00',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    //hideBalance == false ? SizedBox(height: 0):SizedBox(height: 0),
                    hideBalance == true ? Row(
                      children: [
                        Text(
                          'NGN',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        
                        Text(
                           hideBalance == true ? '****' :
                          '0.00',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ) :
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF427f7f),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          '\$0.00',
                          style: TextStyle(
                            color: Color(0xFFafd2d1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Financial services',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Nigeria',
                              style: TextStyle(
                                color: Color(0xFF1e6157),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Icon(Icons.expand_more, color: Color(0xFF1e6157)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: financialServices.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 600 ? 4 : 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.5,
                        ),
                        itemBuilder: (context, index) {
                          final services = financialServices[index];
                          return Column(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
            
                                decoration: BoxDecoration(
                                  color: Color(0xFFedf3f3),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: ClipOval(
                                    child: Image.asset(
                                      services.imageUrl,
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text(services.title),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent transactions',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xFF1e6157),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}

final hideBalanceProvider = StateProvider<bool>((ref) => false);
