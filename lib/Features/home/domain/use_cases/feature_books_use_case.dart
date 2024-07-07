import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/book_entity.dart';

class FeatureBooksUseCase extends UseCase<List<BookEntity>,int>{

  final HomeRepo homeRepo;

  FeatureBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([int param=0]) async{

   return await homeRepo.fetchFeaturesBooks(
       pagenum:param,
   );

  }

 

}

