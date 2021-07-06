import 'package:hication/models/user.dart';

List<User> _userList = [];
String _currentUser = '';

String usernameValidator(var username)
{
  if(username == '')
  {
    return 'Username cannot be empty!';
  }
  else if(username.length < 5)
  {
    return 'Username must be at least 5 characters long';
  }
  else
  {
    var _exist = false;
    for (var i = 0; i < _userList.length; i++) {
      if(_userList[i].username == username)
      {
        _exist = true; break;
      }
    }

    if(_exist)
    {
      return 'Username exists already!';
    }
    else
    {
      return 'Username is ready to be use!';
    }
  }
}

String passwordValidator(var password)
{
  if(password == '')
  {
    return 'Password cannot be empty';
  }
  else if(password.length < 8)
  {
    return 'Password must be at least 8 characters long';
  }
  else
  {
    return 'You have a cool password!';
  }
}

String confirmPasswordValidator(var password1, var password2)
{
  if(password1 != password2)
  {
    return "Password didn't match!";
  }
  else
  {
    return 'Password matched!';
  }
}

bool loginValidation([var username = '', var password = ''])
{
  for (var i = 0; i < _userList.length; i++) {
      if(_userList[i].username == username)
      {
        if(_userList[i].password == password)
        {
          _currentUser = _userList[i].username;
          return true;
        }
      }
  }
  return false;
}

void addUser(var username, var password)
{
  _currentUser = username;
  _userList.add(User(username, password));
}

String getCurrentUsername()
{
  return _currentUser;
}