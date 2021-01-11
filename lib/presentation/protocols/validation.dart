import 'package:flutter/material.dart';

abstract class Validation {
  validate({@required String field, @required String value});
}
