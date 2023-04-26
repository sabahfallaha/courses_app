import '../model/student_model.dart';

class initialState extends Student {
  initialState(
      {required int id,
      required String email,
      required String phone,
      required String name,
      required String token})
      : super(
            // id: id, email: email, phone: phone, name: name,
            token: token);
}
