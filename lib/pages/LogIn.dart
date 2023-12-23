import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

// ignore: non_constant_identifier_names
late String email_value;
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('./assets/images/logo.png'),
              Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Flutter Login',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (String value){
                          email_value = value;
                        },
                        controller: email,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.grey)),
                            labelText: 'Email'),
                        // validator: Validators.compose([
                        //   Validators.required('email is required'),
                        //   Validators.email('invalid email address')
                        // ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(

                        controller: password,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide:
                                BorderSide(width: 1, color: Colors.grey)),
                            labelText: 'Password'),
                        // validator: Validators.compose(
                        //     [Validators.required('password is required')]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/home');
/*                              print(email.text);
                              print(password.text);
                              print('success');*/

                            }
                          },
                          child: const Text("Login"),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
