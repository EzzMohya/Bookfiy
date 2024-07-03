import 'package:bookliy/Core/utils/app_route.dart';
import 'package:bookliy/Core/utils/styles.dart';
import 'package:bookliy/Features/Home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/home_view_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureHomeViewList extends StatelessWidget {
  const FeatureHomeViewList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRoute.kBookDetailsView,
                            extra: state.books[index]);
                      },
                      child: HomeViewListItem(
                        imageUrl:
                            '${state.books[index].volumeInfo!.imageLinks!.thumbnail}',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeatureBooksFailure) {
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
