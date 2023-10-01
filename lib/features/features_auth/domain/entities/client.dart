import 'package:equatable/equatable.dart';

class Client extends Equatable {
  Client(
      {this.email,
      this.password,
      this.profile,
      this.date,
      this.phone,
      required this.isLogin,
      this.firstName,
      this.lastName});
  String? email;
  String? password;
  String? profile;
  String? firstName;
  String? lastName;
  String? phone;
  bool isLogin;
  String? date;
  @override
  // TODO: implement props
  List<Object?> get props =>
      [email, password, profile, firstName, phone, isLogin, date, lastName];
}
