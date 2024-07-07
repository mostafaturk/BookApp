
import 'package:bookly/Features/home/domain/use_cases/feature_books_use_case.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/feature_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates>{
  FeaturedBooksCubit(this.featureBooksUseCase):super(FeaturedBooksInitial());

  final FeatureBooksUseCase featureBooksUseCase;

  Future<void> fetchFeatureBooks({int pagenum=0})async{
    if (pagenum==0) {
      emit(FeaturedBooksLoding());
    }else{
      emit(FeaturedBooksPaginationLoding());
    }
    var result =await featureBooksUseCase.call(pagenum);

    result.fold((failure)  {
      if (pagenum == 0 ) {
        emit(FeaturedBooksFailure(failure.errorMes));
      }else{
        emit(FeaturedBooksPaginationFailure(failure.errorMes));
      }
    }, (books)  {
      emit(FeaturedBooksSuccess(books));
        });
  }

}