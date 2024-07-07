
 import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/feature_books_cubits.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/feature_books_states.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_books_listview_loading.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/error_snack_bar.dart';
import '../../../../../core/widgets/custom_fading_widget.dart';
import '../../../domain/entities/book_entity.dart';

class FeatuedBooksListViewBlocBuilder extends StatefulWidget {
   const FeatuedBooksListViewBlocBuilder({Key? key}) : super(key: key);

  @override
  State<FeatuedBooksListViewBlocBuilder> createState() => _FeatuedBooksListViewBlocBuilderState();
}

class _FeatuedBooksListViewBlocBuilderState extends State<FeatuedBooksListViewBlocBuilder> {

  List<BookEntity> books=[];

   @override
   Widget build(BuildContext context) {
     return BlocConsumer<FeaturedBooksCubit,FeaturedBooksStates>(
       listener: (context,state){
         if(state is FeaturedBooksSuccess){
           books.addAll(state.books);
         }
         if (state is FeaturedBooksPaginationFailure) {
           ScaffoldMessenger.of(context).showSnackBar(
             buildErrorWidget(state.errormesg),
           );
         }
       },
       builder: (context, state) {
         if (state is FeaturedBooksSuccess ||
             state is FeaturedBooksPaginationLoding||
             state is FeaturedBooksPaginationFailure
         ) {
           return FeaturedBooksListView(
             books: books,
           );
         } else if (state is FeaturedBooksFailure) {
           return Text(state.errormesg);
         } else {
           return const FeaturedBooksListViewLoading();
         }
       },
     );
   }
}
