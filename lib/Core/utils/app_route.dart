import 'package:bookliy/Core/utils/service_locator.dart';
import 'package:bookliy/Features/Home/data/models/book_model/book_model.dart';
import 'package:bookliy/Features/Home/data/repo/home_repo_imp.dart';
import 'package:bookliy/Features/Home/presentation/manager/detail_books_cubit/detail_books_cubit_cubit.dart';
import 'package:bookliy/Features/Home/presentation/views/details_view.dart';
import 'package:bookliy/Features/Home/presentation/views/home_view.dart';
import 'package:bookliy/Features/Search/presentation/views/search_view.dart';
import 'package:bookliy/Features/Splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailView';
  static const kSearchView = '/SearchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => DetailBooksCubit(getIt.get<HomeRepoImp>()),
          child:  BookDetailsView(bookModel: state.extra as BookModel,),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
