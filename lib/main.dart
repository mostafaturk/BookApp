import 'package:bookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/feature_books_use_case.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/feature_books_cubits.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/Newest_books_cubits.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/functions/bloc_observer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'Features/Splash/presentation/views/splash_view.dart';
import 'core/utils/functions/setup_service_locate.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer =SimpleBlocObserver();
  setupServiceLocator();
  runApp(const Bookly());

}



class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context){
          return FeaturedBooksCubit(
              FeatureBooksUseCase(
                locate.get<HomeRepoImpl>()
                  ))..fetchFeatureBooks();
    }),

        BlocProvider(create: (context){
          return NewestBooksCubit(
              FetchNewestBooksUseCase(
                  locate.get<HomeRepoImpl>()))..fetchNewestBooks();
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
         // textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
