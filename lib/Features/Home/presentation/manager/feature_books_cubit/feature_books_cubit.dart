import 'package:bloc/bloc.dart';
import 'package:bookliy/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookliy/Features/Home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatureBooksLoading());
    var result = await homeRepo.fetchFeatureBooks();
    result.fold(
      (failure) {
        emit(FeatureBooksFailure(failure.errMessage));
      },
      (books) {
        emit(FeatureBooksSuccess(books));
      },
    );
  }
}
