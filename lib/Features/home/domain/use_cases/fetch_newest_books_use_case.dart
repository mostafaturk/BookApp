import 'package:bookly/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
//import '../../../../core/use_case/no_param_use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,NoParam>{

  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([NoParam? Param]) async{
    // TODO: implement call
    return await homeRepo.fetchNewestBooks();
  }



}