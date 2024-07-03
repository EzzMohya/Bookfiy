import 'package:bookliy/Core/utils/styles.dart';
import 'package:bookliy/Features/Home/presentation/manager/newest_books_cubit/newes_books_cubit.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksList extends StatelessWidget {
  const NewestBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BestSellerItem(
                    books: state.books[index],
                  ),
                );
              });
        } else if (state is NewestBooksFailure) {
          return Text(
            state.errMessage,
            style: Styles.styleMedium16,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
