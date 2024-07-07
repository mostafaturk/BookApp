
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDateSource{
  List<BookEntity>fetchFeaturesBooks({int pagenum=0});
  List<BookEntity>fetchNewestBooks();
}

class HomeLocalDateSourceImpl extends HomeLocalDateSource{
  @override
  List<BookEntity> fetchFeaturesBooks({int pagenum=0}) {
    int startIndex =pagenum * 10 ;
    int endIndex =(pagenum+1)*10 ;
    var box=Hive.box<BookEntity>(kFeaturedBox);
    var length= box.values.length;
    if(startIndex>=length || endIndex>length){
      return [] ;
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box=Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }

}