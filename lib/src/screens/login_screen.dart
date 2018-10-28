import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton()
          ],
        ));
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'you@example.com',
                labelText: 'Email address',
                errorText: snapshot.error),
            onChanged: bloc.changeEmail,
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText: snapshot.error),
            onChanged: bloc.changePassord,
          );
        });
  }

  Widget submitButton() {
    return RaisedButton(
        child: Text('Login'), color: Colors.blue, onPressed: () {});
  }
}
