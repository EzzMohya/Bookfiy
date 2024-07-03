import 'package:bookliy/Core/utils/styles.dart';
import 'package:bookliy/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookliy/Features/Home/presentation/manager/detail_books_cubit/detail_books_cubit_cubit.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/book_action.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/custom_book_app_bar.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/home_view_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailViewBody extends StatelessWidget {
  const BookDetailViewBody({super.key, required this.books});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomBookDetailAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * .24),
            child: HomeViewListItem(
              imageUrl: books.volumeInfo!.imageLinks!.thumbnail.toString(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            books.volumeInfo!.title.toString(),
            style: Styles.styleRegular30,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            books.volumeInfo!.authors![0].toString(),
            style: Styles.styleMedium18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 16,
          ),
          const BookRating(
            rating: 0,
            count: 0,
          ),
          const SizedBox(
            height: 37,
          ),
          const BookAction(),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can also like',
                style: Styles.styleSemiBold18.copyWith(fontSize: 14),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: BookDetailListView(),
          )
        ],
      ),
    );
  }
}

class BookDetailListView extends StatelessWidget {
  const BookDetailListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: BlocBuilder<DetailBooksCubit, DetailBooksCubitState>(
        builder: (context, state) {
          if (state is DetailBooksCubitSuccess) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: HomeViewListItem(
                      imageUrl: state
                          .books[index].volumeInfo!.imageLinks!.thumbnail
                          .toString(),
                    ),
                  );
                });
          } else if (state is DetailBooksCubitFailure) {
            return Text(
              state.errMessage,
              style: Styles.styleMedium16,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
