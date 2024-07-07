

import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCase<Type>{

  Future<Either<Failures,Type>> call();
}

