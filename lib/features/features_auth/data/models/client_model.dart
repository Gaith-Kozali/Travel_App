import '../../domain/entities/client.dart';

class ClientModel extends Client {
  ClientModel(
      {super.email,
      super.password,
      super.profile,
      super.date,
      super.phone,
      super.firstName,
      super.lastName,
      required super.isLogin});
}
