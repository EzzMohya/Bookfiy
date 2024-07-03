import 'package:bloc/bloc.dart';
import 'package:bookliy/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookliy/Features/Home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'detail_books_cubit_state.dart';

class DetailBooksCubit extends Cubit<DetailBooksCubitState> {
  DetailBooksCubit(this.homeRepo) : super(DetailBooksCubitInitial());
  final HomeRepo homeRepo;

  Future<void> fetchDetailBooks({required String category}) async {
    emit(DetailBooksCubitLoading());
    var result = await homeRepo.fetchDetailBooks(category: category);
    result.fold(
      (failure) {
        emit(DetailBooksCubitFailure(failure.errMessage));
      },
      (books) {
        emit(DetailBooksCubitSuccess(books));
      },
    );
  }
}
