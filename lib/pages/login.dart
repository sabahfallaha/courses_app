import 'package:courses_app/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/api.dart';
import '../model/student_model.dart';
import '../services/login_service.dart';
import '../widgets/custom_text_field.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = 'loginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(),
              Container(
                padding: EdgeInsets.only(left: 35, top: 130),
                child: Text(
                  'Welcome\nBack',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              CustomTextField(
                                hintText: 'Email',
                                textColor: Colors.black,
                                enableColor: Colors.black,
                                onChanged: (data) => email = data,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              CustomTextField(
                                hintText: 'Password',
                                obscureText: true,
                                textColor: Colors.black,
                                enableColor: Colors.black,
                                onChanged: (data) => password = data,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sign in',
                                    style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Color(0xff4c505b),
                                    child: IconButton(
                                        color: Colors.white,
                                        onPressed: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            try {
                                              var req = await LoginServise()
                                                  .Login(
                                                      username: email!,
                                                      password: password!);
                                              if (req.statusCode == 200 ||
                                                  req.statusCode == 201) {
                                                print(req.body);
                                                var student =
                                                    Student.fromReqBody(
                                                        req.body);
                                                // Api.storeToken(
                                                //     token: student.token);
                                                student.printAttributes();
                                                print("from storage:");
                                                //    print(Api.readToken());
                                                // BlocProvider.of<StudentCubit>(
                                                //         context)
                                                // .login(student);
                                                Api().upDateSharedPreferences(
                                                    student.token);
                                                print('shared:');
                                                SharedPreferences _prefs =
                                                    await SharedPreferences
                                                        .getInstance();

                                                print(
                                                    _prefs.getString('token'));
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  HomePage.id,
                                                );
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             MyHomePage(
                                                //                 customer:
                                                //                     student)));
                                              } else {
                                                //  pushError(context);
                                              }
                                            } on Exception catch (e) {
                                              // TODO
                                            }
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an account? '),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, RegisterPage.id);
                                    },
                                    child: Text(
                                      'Sign Up',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xff4c505b),
                                          fontSize: 18),
                                    ),
                                    style: ButtonStyle(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
