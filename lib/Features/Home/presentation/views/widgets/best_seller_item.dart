import 'package:bookliy/Core/utils/app_route.dart';
import 'package:bookliy/Core/utils/styles.dart';
import 'package:bookliy/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/best_seller_image.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
    required this.books,
  });
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.kBookDetailsView, extra: books);
      },
      child: Row(
        children: [
          BestSellerItemImage(
            imageUrl: books.volumeInfo!.imageLinks!.thumbnail.toString(),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    books.volumeInfo!.title.toString(),
                    style: Styles.styleRegular20
                        .copyWith(fontFamily: 'GT Sectra Fine'),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  books.volumeInfo!.authors![0].toString(),
                  style: Styles.styleMedium14,
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Free',
                      style: Styles.styleBold20
                          .copyWith(fontFamily: 'GT Sectra Fine'),
                    ),
                    const BookRating(
                      rating: 2,
                      count: 13,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
