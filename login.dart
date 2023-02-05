
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(myapp());
}


/*void main() {
  runApp(myapp());
}*/


class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'title',
      theme : ThemeData(primaryColor : Colors.green),
      home : mypage(),
    );
  }
}

class login {
  var ph = '';
  login(String ph,);
}

class mypage extends StatefulWidget {
  const mypage({Key? key}) : super(key: key);

  @override
  mypagestate createState() => mypagestate();
}

class mypagestate extends State<mypage> {
  final _items = <login>[];

  final _authentication = FirebaseAuth.instance;


  var _todocontainer = TextEditingController();

  /*void addtodo(ph) async {
    var userph  = ph;
    final newuser = await _authentication.createUserWithEmailAndPassword(email: ph['ph'], password: '1234');
    if(newuser.user != null) {
      print('sucess');
    }
  }*/
  void sendmessage(ph) {
    print(ph);
  }


  Widget build(BuildContext context) {
    return Scaffold (
      appBar : AppBar(title : Text('title',),),
      body : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
        Row(
        children: <Widget>[
        Expanded(child: TextField(controller:_todocontainer),),
      TextButton(onPressed: () {

        /*addtodo(login(_todocontainer.text));*/
        sendmessage(_todocontainer.text);
      } , child: Text('ADD'),),
      ],
    ),
    ]
    ),
    ),
    );
  }
}
