
import '../../../domain/entities/book_entity.dart';

abstract class FeaturedBooksStates{}

class FeaturedBooksInitial extends FeaturedBooksStates{}
class FeaturedBooksLoding extends FeaturedBooksStates{}
class FeaturedBooksPaginationLoding extends FeaturedBooksStates{}
class FeaturedBooksPaginationFailure extends FeaturedBooksStates{
  final String errormesg;

  FeaturedBooksPaginationFailure(this.errormesg);
}
class FeaturedBooksSuccess extends FeaturedBooksStates{
 final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}
class FeaturedBooksFailure extends FeaturedBooksStates{
  final String errormesg;

  FeaturedBooksFailure(this.errormesg);
}