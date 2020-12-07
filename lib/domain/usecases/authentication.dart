import 'package:aula_flutter_dev/domain/account_entity.dart';

import 'package:meta/meta.dart';

abstract class Authentication {
  Future<AccountEntity> auth({
    @required String email,
    @required String password
  });
}