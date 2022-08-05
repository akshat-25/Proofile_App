import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double coverHeight = 250;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: [
        buildTop(),
        buildContent(),
      ]),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: bottom),
              child: buildCoverImage()),
          Positioned(top: top, child: buildProfileImage()),
        ]);
  }

  Widget buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            'Akshat Parakh',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Learner | Flutter Developer',
            style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.github),
              SizedBox(
                width: 12,
              ),
              buildSocialIcon(FontAwesomeIcons.twitter),
              SizedBox(
                width: 12,
              ),
              buildSocialIcon(FontAwesomeIcons.linkedin),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Divider(),
          SizedBox(
            height: 16,
          ),
          buildAbout(),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  Widget buildAbout() {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Flutter Developer and self-esteemed engineering  fresher who is capable of applying technical skills for the improvement of the company. Able to effectively self-manage during independent projects, as well as collaborate in a team setting.Adept at working independently and collaboratively on projects, and committed toachieving visual innovation and beauty.',
          style: TextStyle(fontSize: 18, height: 1.3),
        )
      ],
    ));
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://www.codeplatoon.org/wp-content/uploads/2019/04/close-up-code-codes-239898-1030x687.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
            'https://avatars.githubusercontent.com/u/106362820?s=400&u=95667ee0d32e8b547fefd8da8e56b648f4444224&v=4'),
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
      radius: 25,
      child: Material(
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Icon(
            icon,
            size: 32,
          ),
        ),
      ));
}
