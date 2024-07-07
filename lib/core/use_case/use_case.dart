

import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCase<Type,Param>{

  Future<Either<Failures,Type>> call([Param Param]);
}

class NoParam {}