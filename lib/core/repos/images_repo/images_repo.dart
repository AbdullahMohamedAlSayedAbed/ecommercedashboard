import 'dart:io';

import 'package:dartz/dartz.dart';


import '../../error/failers.dart';

abstract class ImagesRepo {
  Future<Either<Failures,String>> uploadImage(File image);
}
