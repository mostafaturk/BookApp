
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/functions/save_books.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> fetchFeaturesBooks({int pagenum=0});
  Future<List<BookEntity>> fetchNewestBooks();

}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturesBooks({int pagenum=0}) async{
    var data = await apiService.get(endPoint:
    'volumes?Filtering=free-ebooks&q=programming&startIndex=${pagenum * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
      saveBooksData(books, kNewestBox);

    }
    return books;
  }



}