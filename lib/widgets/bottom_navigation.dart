import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/screens/main_screen.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            if (index == 1) return;
            ref.read(currentIndexProvider.notifier).state = index;
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFFFFFFF),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet,
                color: Color(0xFF757575),
                size: 35,
              ),
              activeIcon: Icon(
                Icons.account_balance_wallet,
                color: Color(0xFF15645e),
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/transaction.png', height: 35),
              activeIcon: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image.asset(
                  'assets/icons/active_transaction1.png',
                  height: 25,
                  
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
