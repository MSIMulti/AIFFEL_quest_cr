import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Navigation Demo',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool is_cat = true; // 초기값을 true로 설정
  int clickCount = 0; // 클릭 횟수를 저장하는 변수 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg', // 고양이 이미지 아이콘
            width: 24,
            height: 24,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () async {
              setState(() {
                is_cat = false; // 버튼을 클릭하면 is_cat을 false로 변경
              });
              // SecondPage로 이동하고 반환된 값을 받아 is_cat을 업데이트
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(is_cat: is_cat),
                ),
              );
              if (result != null) {
                setState(() {
                  is_cat = result; // SecondPage에서 반환된 값으로 is_cat 업데이트
                });
              }
            },
            child: Text('Next'),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                clickCount++; // 클릭할 때마다 클릭 횟수 증가
              });
              // DEBUG CONSOLE에 클릭 횟수 출력
              print("Click Count: $clickCount, is_cat: $is_cat");
            },
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg', // 고양이 이미지
              width: 300,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final bool is_cat;

  SecondPage({required this.is_cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/6/6e/Golde33443.jpg', // 강아지 이미지 아이콘
            width: 24,
            height: 24,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true); // is_cat을 true로 바꿔서 전달
            },
            child: Text('Back'),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              print("is_cat: $is_cat"); // 이미지 클릭 시 현재 is_cat 상태 출력
            },
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/6/6e/Golde33443.jpg', // 강아지 이미지
              width: 300,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}

// 회고 : 실습을 진행하며 환경세팅의 어려움으로 DartPad 사이트에서 진행했는데,
//        상단좌측에 아이콘은 제한이 있다는 사실을 알고 이미지로 대체하는 과정이 어려웠습니다.
//        또한 이미지를 계속 클릭했을 때 카운트하는 방법은 검색을 통해 수정했습니다.
