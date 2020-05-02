import 'package:bloc_login_sreen/src/blocs/form_bloc.dart';
import 'package:bloc_login_sreen/src/blocs/form_provider.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  // render
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // create instance from Provider Type.
    final FormBloc formBloc = FormProvider.of(context);

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 230.0, left: 50.0, right: 50.0),
          height: 550.0,
          child: Form(
            child: Column(
              children: <Widget>[
                _emailField(formBloc),
                _passwordField(formBloc),
                _checkbox(),
                _button(formBloc),
                _forgotPasswordButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField(FormBloc formBloc) {
    return StreamBuilder<String>(
        stream: formBloc.email,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email',
              errorText: snapshot.error,
            ),
            onChanged: formBloc.changeEmail,
          );
        });
  }

  Widget _passwordField(FormBloc formBloc) {
    return StreamBuilder<String>(
        stream: formBloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            maxLength: 20,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error,
            ),
            onChanged: formBloc.changePassword,
          );
        });
  }

  Widget _checkbox() {
    return Row(
      children: <Widget>[
        Checkbox(
          onChanged: (checked) => this.setState(() => isChecked = !isChecked),
          value: this.isChecked,
        ),
        Text('keep me logged in'),
      ],
    );
  }

  Widget _button(FormBloc formBloc) {
    return StreamBuilder<bool>(
        stream: formBloc.submitValidForm,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              onPressed: snapshot.hasError ? null : formBloc.submit,
              child: const Icon(Icons.arrow_forward),
              color: Colors.teal,
              clipBehavior: Clip.hardEdge,
              elevation: 10,
              disabledColor: Colors.blueGrey,
              disabledElevation: 10,
              disabledTextColor: Colors.white,
            ),
          );
        });
  }

  Widget _forgotPasswordButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/forgot_password'),
          child: Container(
            child: Text('Forgot password?'),
            alignment: Alignment.bottomLeft,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/sign_up'),
          child: Container(
            child: Text('Sign up'),
            alignment: Alignment.bottomLeft,
          ),
        ),
      ],
    );
  }
}
