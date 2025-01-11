import 'package:flutter/material.dart';
import 'package:shopify_merchant/core/presentation/background_widget.dart';
import 'package:shopify_merchant/core/presentation/text_title.dart';
import 'package:shopify_merchant/features/home/presentation/widgets/dashboard_widget.dart';
import 'package:shopify_merchant/features/home/presentation/widgets/recent_updates_widget.dart';
import 'package:shopify_merchant/features/home/presentation/widgets/track_your_store_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitle(text: "Home"),
                SizedBox(height: 30),
                TrackYourStoreCard(),
                SizedBox(height: 10),
                DashboardWidget(),
                SizedBox(height: 30),
                Expanded(child: RecentUpdatesWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
