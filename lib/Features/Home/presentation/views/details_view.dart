import 'package:bookliy/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookliy/Features/Home/presentation/manager/detail_books_cubit/detail_books_cubit_cubit.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/detail_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DetailBooksCubit>(context).fetchDetailBooks(
        category: widget.bookModel.volumeInfo!.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailViewBody(books:widget.bookModel,),
    );
  }
}
