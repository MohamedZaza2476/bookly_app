import 'package:bookly_app/features/splash/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/widgets.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 30),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BestSellerListViewItem(),
        );
      },
    );
  }
}
