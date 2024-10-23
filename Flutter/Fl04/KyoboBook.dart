import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kyobo Bookstore Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainImageScreen(),
    );
  }
}

// 1. Main Image Screen
class MainImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('교보북스 메인'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EbookImageScreen()),
          );
        },
        child: Center(
          // Center 위젯으로 이미지를 중앙 정렬
          child: Image.asset(
            'assets/1메인.jpg',
            fit: BoxFit.contain, // 비율을 유지하면서 화면에 맞추어 표시
          ),
        ),
      ),
    );
  }
}

// 2. Ebook Image Screen
class EbookImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('교보북스 이북'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StoreImageScreen()),
          );
        },
        child: Center(
          // Center 위젯으로 이미지를 중앙 정렬
          child: Image.asset(
            'assets/2이북.jpg',
            fit: BoxFit.contain, // 비율을 유지하면서 화면에 맞추어 표시
          ),
        ),
      ),
    );
  }
}

// 3. Store Image Screen
class StoreImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('교보북스 매장'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchImageScreen()),
          );
        },
        child: Center(
          // Center 위젯으로 이미지를 중앙 정렬
          child: Image.asset(
            'assets/3매장.jpg',
            fit: BoxFit.contain, // 비율을 유지하면서 화면에 맞추어 표시
          ),
        ),
      ),
    );
  }
}

// 4. Search Image Screen
class SearchImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('교보북스 검색'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyPageImageScreen()),
          );
        },
        child: Center(
          // Center 위젯으로 이미지를 중앙 정렬
          child: Image.asset(
            'assets/5검색.jpg',
            fit: BoxFit.contain, // 비율을 유지하면서 화면에 맞추어 표시
          ),
        ),
      ),
    );
  }
}

// 5. MyPage Image Screen
class MyPageImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('교보북스 마이페이지'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryImageScreen()),
          );
        },
        child: Center(
          // Center 위젯으로 이미지를 중앙 정렬
          child: Image.asset(
            'assets/6마이페이지.jpg',
            fit: BoxFit.contain, // 비율을 유지하면서 화면에 맞추어 표시
          ),
        ),
      ),
    );
  }
}

// 6. Category Image Screen
class CategoryImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('교보북스 카테고리'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainImageScreen()),
          );
        },
        child: Center(
          // Center 위젯으로 이미지를 중앙 정렬
          child: Image.asset(
            'assets/7카테고리.jpg',
            fit: BoxFit.contain, // 비율을 유지하면서 화면에 맞추어 표시
          ),
        ),
      ),
    );
  }
}
