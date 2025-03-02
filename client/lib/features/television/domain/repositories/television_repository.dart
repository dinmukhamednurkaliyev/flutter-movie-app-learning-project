import 'package:dartz/dartz.dart';

abstract class TelevisionRepository {
  Future<Either> getPopularTelevision();
}