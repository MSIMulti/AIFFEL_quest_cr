import 'package:flutter/material.dart';

// 애플리케이션이 실행되면 main 함수가 호출되어 FlutterApp을 실행
void main() {
  runApp(FlutterApp());
}

// FlutterApp 클래스: 앱의 기본 구조를 정의하는 Stateless 위젯
class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp 위젯: 애플리케이션의 루트 위젯
    return MaterialApp(
      home: HomePage(), // 첫 화면(HomePage)을 지정
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true, // 앱바 제목을 모든 플랫폼에서 중앙 정렬
        ),
      ),
    );
  }
}

// HomePage 클래스: 메인 화면을 구성하는 Stateless 위젯
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold: 앱의 기본 구조를 제공하는 위젯 (앱바, 바디, 플로팅 버튼 등 포함)
    return Scaffold(
      appBar: AppBar(
        title: const Text('플러터 앱 만들기'), // 앱바 중앙에 텍스트
        backgroundColor: Colors.blue, // 앱바의 배경색을 파란색으로 설정
        leading: IconButton(
          icon: CustomPaint(
            size: const Size(24, 24), // 아이콘 크기
            painter: FIconPainter(), // F 모양 아이콘을 그리는 CustomPainter 호출
          ),
          onPressed: () {
            // 아이콘 클릭 시 동작 (현재 아무 동작 없음)
          },
        ),
      ),
      // 화면의 주요 내용을 구성하는 Body
      body: Column(
        children: [
          // 첫 번째 위젯: 버튼을 화면 중앙에 배치
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // 버튼이 눌리면 콘솔에 "버튼이 눌렀습니다." 출력
                  print('버튼이 눌렀습니다.');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // 버튼을 네모난 모양으로 설정
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 20, // 버튼 크기 설정
                  ),
                ),
                // 버튼 안에 표시될 텍스트
                child: const Text(
                  'Text', // 텍스트 내용
                  style: TextStyle(
                    fontSize: 20, // 텍스트 크기
                    fontWeight: FontWeight.bold, // 텍스트를 굵게 표시
                  ),
                ),
              ),
            ),
          ),
          // 두 번째 위젯: 화면 하단에 5개의 중첩된 사각형 표시
          Stack(
            alignment: Alignment.bottomRight, // 사각형을 오른쪽 아래로 정렬
            children: [
              Container(
                width: 300,
                height: 300,
                color: Colors.grey[800], // 가장 큰 사각형 (어두운 회색)
              ),
              Positioned(
                right: 60,
                bottom: 60,
                child: Container(
                  width: 240,
                  height: 240,
                  color: Colors.grey[700], // 두 번째 사각형 (점점 밝아지는 회색)
                ),
              ),
              Positioned(
                right: 120,
                bottom: 120,
                child: Container(
                  width: 180,
                  height: 180,
                  color: Colors.grey[600], // 세 번째 사각형
                ),
              ),
              Positioned(
                right: 180,
                bottom: 180,
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey[500], // 네 번째 사각형
                ),
              ),
              Positioned(
                right: 240,
                bottom: 240,
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[400], // 가장 작은 사각형 (밝은 회색)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// F 모양 아이콘을 그리기 위한 CustomPainter 클래스
class FIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // F 모양을 그릴 때 사용할 페인트 설정 (검은색, 꽉 찬 스타일)
    final paint = Paint()
      ..color = Colors.black // F 모양의 색상을 검은색으로 설정
      ..style = PaintingStyle.fill; // F 모양을 채움으로 그리기

    // F 모양을 정의하는 경로
    final path = Path()
      ..moveTo(4, 0) // 시작점 이동
      ..lineTo(size.width, 0) // 오른쪽 상단까지 직선
      ..lineTo(size.width, size.height * 0.25) // 아래로 25% 내려간 지점까지 직선
      ..lineTo(4, size.height * 0.25) // 왼쪽으로 직선
      ..lineTo(4, size.height * 0.5) // 중간 지점까지 아래로 직선
      ..lineTo(size.width * 0.6, size.height * 0.5) // 오른쪽으로 직선
      ..lineTo(size.width * 0.6, size.height * 0.75) // 75% 높이까지 아래로 직선
      ..lineTo(4, size.height * 0.75) // 왼쪽으로 직선
      ..lineTo(4, size.height) // 바닥까지 직선
      ..lineTo(0, size.height) // 왼쪽 하단으로 이동
      ..lineTo(0, 0) // 다시 시작점으로 이동
      ..close(); // 경로 닫기

    // 캔버스에 경로를 그리고 색상을 채움
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // 이 페인터는 상태가 변하지 않으므로 다시 그릴 필요가 없음
    return false;
  }
}