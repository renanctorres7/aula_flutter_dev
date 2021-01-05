import 'package:aula_flutter_dev/ui/components/component.dart';
import 'package:aula_flutter_dev/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'login_presenter.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginHeader(),
            Headline1(
              text: 'Login',
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                child: Column(
                  children: [
                    StreamBuilder<String>(
                        stream: presenter.emailErrorStream,
                        builder: (context, snapshot) {
                          return TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Email',
                                icon: Icon(Icons.email),
                                errorText: snapshot.data?.isEmpty == true
                                    ? null
                                    : snapshot.data),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: presenter.validateEmail,
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 32),
                      child: StreamBuilder<String>(
                          stream: presenter.passwordErrorStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Senha',
                                  icon: Icon(Icons.lock),
                                  errorText: snapshot.data?.isEmpty == true
                                      ? null
                                      : snapshot.data),
                              obscureText: true,
                              onChanged: presenter.validatePassword,
                            );
                          }),
                    ),
                    RaisedButton(
                      onPressed: null,
                      child: Text('Entrar'.toUpperCase()),
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      label: Text('Criar conta'),
                      icon: Icon(Icons.person),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
