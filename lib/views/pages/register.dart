import 'package:flutter/material.dart';
import 'package:hication/utils/administration.dart';
import 'package:hication/utils/ui-global.dart' as globals;
import 'package:hication/views/pages/home.dart';
import 'package:hication/views/pages/login.dart';
import 'package:hication/views/pages/register.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }

}

class RegisterPageState extends State<RegisterPage> {
  var _ctrlUsername = TextEditingController();
  var _ctrlPass = TextEditingController();
  var _ctrlCPass = TextEditingController();
  String _usernameErrorMessage = '';
  String _passwordErrorMessage = '';
  String _cpasswordErrorMessage = '';
  @override
  void initState() {
    super.initState();

    _ctrlUsername.addListener(updateUsernameMessage);
    _ctrlPass.addListener(updatePasswordMessage);
    _ctrlCPass.addListener(updateCPasswordMessage);
  }

  @override
  void dispose() {
    _ctrlUsername.dispose();
    _ctrlPass.dispose();
    super.dispose();
  }

  void updateUsernameMessage() {
    setState(() {
      _usernameErrorMessage = usernameValidator(_ctrlUsername.text);  
    });
  }

  void updatePasswordMessage() {
    setState(() {
      _passwordErrorMessage = passwordValidator(_ctrlPass.text);  
    });
  }

  void updateCPasswordMessage() {
    setState(() {
      _cpasswordErrorMessage = confirmPasswordValidator(_ctrlPass.text, _ctrlCPass.text);  
    });
  }

  void _onPressed(BuildContext context) {
    if(_usernameErrorMessage == 'Username is ready to be use!' && _passwordErrorMessage == 'You have a cool password!' && _cpasswordErrorMessage == 'Password matched!')
    {
      addUser(_ctrlUsername.text, _ctrlPass.text);
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context)=> HomePage()),
      );
    }
    // if(_ctrlUsername.text == '' || _ctrlPass.text == '')
    // {
    //   // DEPRECATED
    //   // Scaffold.of(ctx).showSnackBar(
    //   //   SnackBar(content: Text('Username and Password is Empty!')));
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You have error message!'))
        );
    // }
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
        //   appBar: AppBar(
        //     elevation: 0,
        //   title: Text('Welcome Hication User'),
        //   backgroundColor: globals.randomizeColor(),
        // ),
      body: ListView(
          children: [
            Container(
              height: 160.0,
              width: 1000,
              margin: EdgeInsets.fromLTRB(20, 50, 20, 50),
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
              height: 400,
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
                    height: 20.0,
                    width: 300,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      _usernameErrorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
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

                  Container(
                    height: 20.0,
                    width: 300,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      _passwordErrorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ), 
                  ),

                  Container(
                    height: 60.0,
                    width: 300,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child:
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Confirm Password'),
                        controller: _ctrlCPass,
                      ),
                  ),

                  Container(
                    height: 20.0,
                    width: 300,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      _cpasswordErrorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ), 
                  ),

                  ElevatedButton(
                    onPressed: ()=>_onPressed(context), 
                    child: Text('REGISTER')
                  ),
                  
                  Container(
                    height: 20,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? "
                        ),
                        InkWell(
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              color: Colors.blue[600]
                            ),
                          ),
                          onTap: () => Navigator.push(
                                        context, 
                                        MaterialPageRoute(
                                          builder: (context)=> LoginPage()
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