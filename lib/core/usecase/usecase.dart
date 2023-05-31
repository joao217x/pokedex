import 'package:pokedex/core/error/failure.dart';
import 'package:pokedex/core/usecase/utils/either.dart';

abstract class UseCase<TR, TP> {
  Future<Either<Failure, TR>> handle(TP params);
}

class NoParams {
  const NoParams._internal();
  @override
  String toString() => '()';
}

const NoParams emptyParams = NoParams._internal();
