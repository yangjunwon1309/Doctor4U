import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';

final dummyItems = [
  'https://cdn.pixabay.com/photo/2023/01/26/18/09/zebra-7746719_960_720.jpg',
  'https://cdn.pixabay.com/photo/2016/01/02/16/53/lion-1118467_960_720.jpg',
  'https://cdn.pixabay.com/photo/2012/06/19/10/32/owl-50267_960_720.jpg',
];

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}

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

class page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Text('first', style:TextStyle(color:Colors.green),),
          /*alt + enter 이용해 위젯 쉽게 씌우고 벗기기*/
        ],
      ),),
    );
  }
}

class page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildtop(),
        _buildmiddle(),
        _buildbottom(),
      ],
    );
  }
  Widget _buildtop() {
    return Padding(
      padding: const EdgeInsets.only(top:20.0,bottom:20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  print('click');
                },
                child: Column(
                  children: <Widget> [

                    Icon(Icons.local_activity, size:40,),
                    Text('menu 1'),
                  ],
                ),),
              Column(
                children: <Widget> [
                  Icon(Icons.local_activity, size:40,),
                  Text('menu 1'),
                ],
              ),
              Opacity(
                opacity: 0.0,
                child: Column(
                  children: <Widget> [
                    Icon(Icons.local_activity, size:40,),
                    Text('menu 1'),
                  ],
                ),),
            ],
          ),
          SizedBox(height:20,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget> [
                    Icon(Icons.local_activity, size:40,),
                    Text('menu 1'),
                  ],
                ),
                Column(
                  children: <Widget> [
                    Icon(Icons.local_activity, size:40,),
                    Text('menu 1'),
                  ],
                ),
              ]
          )
        ],
      ),
    );
  }
  Widget _buildmiddle() {
    return CarouselSlider(
      options:CarouselOptions(autoPlay: true, height:400.0,),
      items: dummyItems.map((url) {
        return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child : Image.network(
                        url, fit: BoxFit.cover,
                      )
                  )
              );
            }
        );
      }).toList(),);
  }

  Widget _buildbottom() {
    final items = List.generate(10, (i) {
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('this is a notification'),
      );
    });
    return ListView(
      physics: NeverScrollableScrollPhysics(), /*리스트 자체 스크롤 금지*/
      shrinkWrap:true,  /*다른 스크롤 객체 안에 있다면 작성해야함*/
      children: items,
    );
  }

}



class page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('third', style:TextStyle(color:Colors.green),),),
    );
  }
}

class mypage extends StatefulWidget {
  @override
  mypagestate createState() => mypagestate();
}

class mypagestate extends State<mypage> {
  var _index = 0;
  var _pages = [
    page1(),
    page2(),
    page3(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar(
          backgroundColor: Colors.green,
          title: Text('Page Name',style:TextStyle(color:Colors.white),),
          centerTitle:true,
          actions: <Widget> [
            IconButton(icon:Icon(Icons.add, color:Colors.white),
              onPressed: (){},),
          ],
        ),

        body : _pages[_index],

        bottomNavigationBar: BottomNavigationBar(onTap: (index) {
          setState(() {_index=index;});
        }, currentIndex:_index, /*현재 선택된 인덱스 번호를 _index에 저장 후 표시*/
            items:<BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'first',),
              BottomNavigationBarItem(label: 'second', icon: Icon(Icons.assignment),),
              BottomNavigationBarItem(label: 'third', icon: Icon(Icons.account_circle),),
            ]
        )
    );
  }
}