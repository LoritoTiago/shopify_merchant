import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/presentation/background_widget.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/features/home/presentation/conrtoller/home_controller.dart';
import 'package:shopify_merchant/features/home/presentation/widgets/dashboard_widget.dart';
import 'package:shopify_merchant/features/home/presentation/widgets/recent_updates_widget.dart';
import 'package:shopify_merchant/features/home/presentation/widgets/track_your_store_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextTitle(text: "Home"),
                const SizedBox(height: 30),
                const TrackYourStoreCard(),
                const SizedBox(height: 10),
                DashboardWidget(
                  controller: _controller,
                ),
                const SizedBox(height: 30),
                Expanded(
                    child: RecentUpdatesWidget(
                  controller: _controller,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
