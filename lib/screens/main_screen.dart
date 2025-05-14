import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/screens/home_screen.dart';
import 'package:pretium/screens/transactions_screen.dart';
import 'package:pretium/widgets/bottom_navigation.dart';
import 'package:pretium/widgets/floating_button_widget.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    return Scaffold(
      backgroundColor: Color(0xFFedf3f3),
      body: IndexedStack(
        index: currentIndex,
        children: [HomeScreen(),SizedBox(), TransactionsScreen()],
      ),
      floatingActionButton: FloatingButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

final currentIndexProvider = StateProvider<int>((ref) => 0);
