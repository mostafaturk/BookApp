
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{

  Future<Either<Failures,List<BookEntity>>>fetchFeaturesBooks({int pagenum=0});
  Future<Either<Failures,List<BookEntity>>>fetchNewestBooks();


}