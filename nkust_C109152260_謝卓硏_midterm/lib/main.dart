import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    Center(child: screen1()),
    Center(child: screen2()),
    Center(child: screen3()),
    Center(child: screen4()),
  ];

  int _currentindex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Midterm'),),
        body: tabs[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18.0,
          unselectedFontSize: 14.0,
          iconSize: 30.0,
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
                                    label: 'Home',
                                    ),
            BottomNavigationBarItem(icon: Icon(Icons.book),
                                    label: 'About Me',
                                    ),
            BottomNavigationBarItem(icon: Icon(Icons.next_plan),
                                    label: 'Plan',
                                    ),
            BottomNavigationBarItem(icon: Icon(Icons.school_sharp),
                                    label: 'Project',
                                    ),
          ],
          onTap: (index) { setState(() {
                                       _currentindex=index;
                                       if (index!=0) {
                                         player.stop();
                                       }
                         });
        },
      ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='I come from Hong Kong and I am studying at the '
      'National Kaohsiung University of Science and Technology in Taiwan. '
      'My mother language is Cantonese and i could speak fluent english. ';

  final String s2='My Major is Computer Science and I am a year 3 student now. '
      'I have learned lots of coding skill such as Java,C++,HTML,Python '
      'and i also could use different devlopment tool like Flutter and Thunkable. ';

  final String s3='When I learn those coding skill from my lecture and tutorial,'
      'I find that I am really interested in software design. '
      'My dream is to work in a game studio or jobs that are '
      'related to software design or development. '
      'I would like to learn more about game design skill'
      'in the future to achieve my dream. ';

  @override
  Widget build(BuildContext context) {

    player.play(AssetSource("3.mp3"));

    return SingleChildScrollView(
      child: Column(
        children:<Widget>[
          //先放個標題
          Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text("Who am I?",
                style: TextStyle(fontSize:24,
                  fontWeight:FontWeight.bold,color:Colors.orange)),
          ),
          Container(
            child: Image.asset('images/1.jpg'),
            height: 70,
            width: 70,
          ),
          SizedBox(height: 30,),

          //文字自傳部份
          const Image(image: NetworkImage
            ('https://www.nationsonline.org/gallery/Hong-Kong/Hong-Kong-skyline-at-night.jpg'),
          ),
          Text('\n'),

          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [ BoxShadow(color: Colors.amberAccent,
                  offset: Offset(6, 6)),
              ],),
            child:Text(s1,
              style: TextStyle(fontSize: 20),),
          ),

          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [ BoxShadow(color: Colors.amberAccent,
                  offset: Offset(6, 6)),
              ],),
            child:Text(s2,
              style: TextStyle(fontSize: 20),),
          ),

          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [ BoxShadow(color: Colors.amberAccent,
                  offset: Offset(6, 6)),
              ],),
            child:Text(s3,
              style: TextStyle(fontSize: 20),),
          ),

          //放一張照片
          Container(

            child: Image.asset('images/f3.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30,),

          //一列放兩個圖
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/f4.jpg'),
                    fit: BoxFit.cover ,
                  ),
                  color: Colors.white,
                ),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/f5.png'),
                    fit: BoxFit.cover ,
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    player.play(AssetSource("2.mp3"));

    return Container(
      child:Column(
        children: [
          //有多種排版方式, 此處以最直覺的方式將每一列放文字內容
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("學習歷程",style: TextStyle(fontSize: 25,color:Colors.red)),],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: 350,
                child: ListView(
                  children: [
                    //條列式參考
                    Text('2012-2018/05 :'),
                    Text('中華基督教會基道中學\n',style: TextStyle(fontSize: 17,color:Colors.green)),

                    Text('2019-2020/05'),
                    Text('香港城市大學專上學院',style: TextStyle(fontSize: 17,color:Colors.green)),
                    Text('(Associate of Science in Information System Development)'),

                    Text('平均分數 (GPA):3.14/4.00',style: TextStyle(fontSize: 17,color:Colors.red)),
                    Text('學習過的相關課程:'),

                    Text('Introduction to Programming (Java)'),
                    Text('Object-Oriented Programming and Design (C++) '),
                    Text('Introduction to Web Development (HTML/CSS)\n'),

                    Text('2020/09'),
                    Text('國立高雄科技大學資訊工程系（在學中)',style: TextStyle(fontSize: 17,color:Colors.green)),
                  ],
                ),
              ),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("專長",style: TextStyle(fontSize: 25,color:Colors.blue)),],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 350,
                child: ListView(
                  children: [
                    //條列式參考
                    Text('HTML/CSS (基本操作)\n'),
                    Text('Python (基本操作)\n'),
                    Text('C++ (基本操作)\n'),
                    Text('Java (基本操作)\n'),
                    Text('C# (基本操作)'),

                  ],
                ),
              ),
            ],),
        ],
      ),);
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    player.play(AssetSource("4.mp3"));


    return Container(
      child:Column(
        children: [
          //有多種排版方式, 此處以最直覺的方式將每一列放文字內容
          Container(
            child: Image.asset('images/3.gif'),
            height: 70,
            width: 70,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Planning?",style: TextStyle(fontSize: 25,color:Colors.blue)),],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: 200,
                    width: 300,
                  child: ListView(
                    children: [
                      //條列式參考
                      Text('1. 考取證照 (Flutter / Thunkable):\n',style: TextStyle(color:Colors.blueGrey)),
                      Text('2. 考取IELTS(目標:7級以上)\n',style: TextStyle(color:Colors.green)),
                      Text('3. 學習更多Coding Skill\n',style: TextStyle(color:Colors.red)),
                      Text('4. 學習Game Design(Unity)\n',style: TextStyle(color:Colors.orange)),
                      Text('5. 修讀碩士課程\n',style: TextStyle(color:Colors.lightBlue)),
                    ],
                  ),
                ),
              ],),

          Container(
            child: Image.asset('images/2.png'),
            height: 70,
            width: 70,
          ),

        ],
      ),);
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final String t1='打算設計一個可以用來判斷假新聞的APP，可以通過後台的資料庫去判斷文章'
        '是否有機會為一篇新聞，例如可以用內容、作者、標題、關鍵字等等'
        '去比較資料庫裏面的資料（已經證實為假新聞的資料），'
        'APP主要是用來避免被假新聞影響';

    final String t2='因為我對遊戲設計很有興趣，所以也有考慮過用Flutter 去設計一款簡單的遊戲'
        '，因為有在網路上找到Flutter 的toolkit可以用來設計遊戲，也有很多影片和教學'
        '所以也有打算設計一個簡單的遊戲APP'
        '（如果可行的話）';

    player.play(AssetSource("5.mp3"));

    return SingleChildScrollView(
      child: Column(
        children:<Widget>[
            //有多種排版方式, 此處以最直覺的方式將每一列放文字內容
            Container(
              child: Image.asset('images/4.gif'),
              height: 70,
              width: 70,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("專案方向",style: TextStyle(fontSize: 25,color:Colors.red)),],
            ),

            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [ BoxShadow(color: Colors.lightGreen,
                    offset: Offset(6, 6)),
                ],),
              child:Text(t1,
                style: TextStyle(fontSize: 18),),
            ),

            Container(
              child: Image.asset('images/5.png'),
              height: 70,
              width: 70,
            ),

            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [ BoxShadow(color: Colors.blueGrey,
                    offset: Offset(6, 6)),
                ],),
              child:Text(t2,
                style: TextStyle(fontSize: 18),),
            ),
        ],
      ),
    );
  }
}
