import 'package:bookliy/Core/utils/app_constant.dart';
import 'package:bookliy/Core/utils/app_route.dart';
import 'package:bookliy/Core/utils/service_locator.dart';
import 'package:bookliy/Features/Home/data/repo/home_repo_imp.dart';
import 'package:bookliy/Features/Home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookliy/Features/Home/presentation/manager/newest_books_cubit/newes_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BookLyApp());
}

class BookLyApp extends StatelessWidget {
  const BookLyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeatureBooksCubit(getIt.get<HomeRepoImp>())..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImp>())..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoute.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: AppConstant.kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
