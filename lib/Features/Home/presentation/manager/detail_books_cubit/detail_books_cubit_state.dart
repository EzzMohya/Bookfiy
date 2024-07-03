part of 'detail_books_cubit_cubit.dart';

sealed class DetailBooksCubitState extends Equatable {
  const DetailBooksCubitState();

  @override
  List<Object> get props => [];
}

final class DetailBooksCubitInitial extends DetailBooksCubitState {}

final class DetailBooksCubitLoading extends DetailBooksCubitState {}

final class DetailBooksCubitSuccess extends DetailBooksCubitState {
  final List<BookModel> books;

  const DetailBooksCubitSuccess(this.books);
}

final class DetailBooksCubitFailure extends DetailBooksCubitState {
  final String errMessage;

  const DetailBooksCubitFailure(this.errMessage);
}
