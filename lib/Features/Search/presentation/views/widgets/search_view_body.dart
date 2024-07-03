import 'package:bookliy/Core/utils/styles.dart';
import 'package:bookliy/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookliy/Features/Search/presentation/views/widgets/search_tex_filed.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(),
            SizedBox(
              height: 16,
            ),
            Text(
              'Best Seller',
              style: Styles.styleSemiBold18,
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(child: SearchLisView())
          ],
        ),
      ),
    );
  }
}

class SearchLisView extends StatelessWidget {
  const SearchLisView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: BestSellerItem(
               books:   BookModel(),
            ),
          );
        });
  }
}
