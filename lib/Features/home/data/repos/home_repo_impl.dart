

import 'package:bookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeLocalDateSource homeLocalDateSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeLocalDateSource,required this.homeRemoteDataSource});
  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeaturesBooks({int pagenum=0})async {

    try {
      var booksList =homeLocalDateSource.fetchFeaturesBooks(pagenum: pagenum);
      if(booksList.isNotEmpty){
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchFeaturesBooks(pagenum: pagenum);
      return right(books);
    } catch (e) {
     if (e is DioError){
       return left(ServerFailure.fromDiorError(e));
     }
     return left(ServerFailure(e.toString()));

    }

  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks() async{
    try {
      List<BookEntity>books;
      books =homeLocalDateSource.fetchNewestBooks();
      if(books.isNotEmpty){
        return right(books);
      }
       books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioError){
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}