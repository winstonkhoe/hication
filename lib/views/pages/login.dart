import 'package:flutter/material.dart';
import 'package:hication/utils/administration.dart';
import 'package:hication/utils/ui-global.dart' as globals;
import 'package:hication/views/pages/home.dart';
import 'package:hication/views/pages/register.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var _ctrlUsername = TextEditingController();
  var _ctrlPass = TextEditingController();

  void _onPressed(BuildContext ctx) {
      if(loginValidation(_ctrlUsername.text, _ctrlPass.text))
      {
        Navigator.push(
          ctx, 
          MaterialPageRoute(
            builder: (ctx)=> HomePage()
          )
        );
      }
      else
      {
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(content: Text('Username / Password is wrong'))
          );
      }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mountain-view/1.jpg'),
            fit: BoxFit.cover
          )
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      body: ListView(
          children: [
            Container(
              height: 160.0,
              width: 1000,
              margin: EdgeInsets.fromLTRB(20, 70, 20, 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/logo-simple-title.png'),
                  fit: BoxFit.fitHeight,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: 350,
              width: 300,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: globals.randomizeColor(),
                boxShadow: [
                  BoxShadow(
                    // color: globals.randomizeColor(),
                    color: Colors.black38,
                    spreadRadius: 2,
                    blurRadius: 10,

                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ), 
              child: ListView(
                children: [
                  Container(
                    height: 60.0,
                    width: 300,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Username'),
                      controller: _ctrlUsername,
                    ), 
                  ),
                  Container(
                    height: 60.0,
                    width: 300,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child:
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Password'),
                        controller: _ctrlPass,
                      ),
                  ),
                  ElevatedButton(
                    onPressed: ()=>_onPressed(context), 
                    child: Text('LOGIN')
                  ),
                  Container(
                    height: 20,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Text(
                          "Don't have an account? "
                        ),
                        InkWell(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.blue[600]
                            ),
                          ),
                          onTap: () => Navigator.push(
                                        context, 
                                        MaterialPageRoute(
                                          builder: (context)=> RegisterPage()
                                          )
                                      ),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ],
        )
      ),
      );
  }
}