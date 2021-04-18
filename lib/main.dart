import 'package:flutter/material.dart';
import 'package:handle/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: 'Home'),
        '/detail': (context) => DetailPage(title: '상세화면'),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class Person {
  String name;
  String profileImg;
  String price;

  Person({this.name, this.profileImg, this.price});
}

class _HomePageState extends State<HomePage> {
  List<Person> persons = [
    Person(
        name: 'W 모터스 라이칸 하이퍼스포트',
        profileImg:
            'https://img1.daumcdn.net/thumb/R720x0/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2FKCCAUTO%2F30f49582ea6d4a598561c1986efcf2ec.JPG',
        price: '약 38억 4천만원'),
    Person(
        name: '카니발 4세대9인승 시그니처',
        profileImg:
            'https://ci.encar.com/carpicture/carpicture06/pic2936/29364464_001.jpg?impolicy=heightRate&rh=480&cw=640&ch=480&cg=Center&wtmk=https://ci.encar.com/wt_mark/w_mark_03.png&t=20210323170454',
        price: "3,932만원"),
    Person(
        name: '4시리즈 (F32)428i M 스포츠 컨버터블',
        profileImg:
            'https://ci.encar.com/carpicture/carpicture03/pic2933/29331711_001.jpg?impolicy=heightRate&rh=480&cw=640&ch=480&cg=Center&wtmk=https://ci.encar.com/wt_mark/w_mark_03.png&t=20210322112331',
        price: '3,860만원'),
    Person(
        name: 'W 모터스 라이칸 하이퍼스포트',
        profileImg:
            'https://img1.daumcdn.net/thumb/R720x0/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2FKCCAUTO%2F30f49582ea6d4a598561c1986efcf2ec.JPG',
        price: '약 38억 4천만원'),
    Person(
        name: '카니발 4세대9인승 시그니처',
        profileImg:
            'https://ci.encar.com/carpicture/carpicture06/pic2936/29364464_001.jpg?impolicy=heightRate&rh=480&cw=640&ch=480&cg=Center&wtmk=https://ci.encar.com/wt_mark/w_mark_03.png&t=20210323170454',
        price: "3,932만원"),
    Person(
        name: '4시리즈 (F32)428i M 스포츠 컨버터블',
        profileImg:
            'https://ci.encar.com/carpicture/carpicture03/pic2933/29331711_001.jpg?impolicy=heightRate&rh=480&cw=640&ch=480&cg=Center&wtmk=https://ci.encar.com/wt_mark/w_mark_03.png&t=20210322112331',
        price: '3,860만원'),
    Person(
        name: 'W 모터스 라이칸 하이퍼스포트',
        profileImg:
            'https://img1.daumcdn.net/thumb/R720x0/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2FKCCAUTO%2F30f49582ea6d4a598561c1986efcf2ec.JPG',
        price: '약 38억 4천만원'),
    Person(
        name: '카니발 4세대9인승 시그니처',
        profileImg:
            'https://ci.encar.com/carpicture/carpicture06/pic2936/29364464_001.jpg?impolicy=heightRate&rh=480&cw=640&ch=480&cg=Center&wtmk=https://ci.encar.com/wt_mark/w_mark_03.png&t=20210323170454',
        price: "3,932만원"),
    Person(
        name: '4시리즈 (F32)428i M 스포츠 컨버터블',
        profileImg:
            'https://ci.encar.com/carpicture/carpicture03/pic2933/29331711_001.jpg?impolicy=heightRate&rh=480&cw=640&ch=480&cg=Center&wtmk=https://ci.encar.com/wt_mark/w_mark_03.png&t=20210322112331',
        price: '3,860만원'),
  ];

  Widget personDetailCard(Person) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
          child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(title: '상세화면')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(Person.profileImg)))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Person.name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    Person.price,
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
                children: persons.map((p) {
              return personDetailCard(p);
            }).toList()),
          )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
