import 'package:bloc/bloc.dart';
import 'package:bookliy/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookliy/Features/Home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newes_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
