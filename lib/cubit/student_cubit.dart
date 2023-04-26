import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/student_model.dart';
import 'initial_state.dart';

class StudentCubit extends Cubit<Student> {
  StudentCubit()
      : super(
            initialState(id: 0, email: '0', phone: '0', name: '0', token: '0'));

  void login(Student student) => emit(student);

  //void logout() =>  emit(null);

}
