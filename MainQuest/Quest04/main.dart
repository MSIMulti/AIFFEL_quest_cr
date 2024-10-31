import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DDayMainPage(),
    );
  }
}

class DDayMainPage extends StatelessWidget {
  final List<String> _images = [
    'assets/birthday.png',
    'assets/examination.png',
  ];

  DDayMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            '그날이 오면',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2, // 2x2 그리드
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: _images.map((image) {
                  return GestureDetector(
                    onTap: () {
                      if (image == 'assets/birthday.png') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BirthdayPage()),
                        );
                      } else if (image == 'assets/examination.png') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExaminationPage()),
                        );
                      }
                    },
                    child: Image.asset(image, fit: BoxFit.cover),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExaminationPage extends StatefulWidget {
  @override
  _ExaminationPageState createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage> {
  final TextEditingController _examController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<Map<String, String>> savedExamData = []; // 시험 정보 저장할 리스트

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveExamData() {
    setState(() {
      savedExamData.add({
        'exam': _examController.text,
        'date': DateFormat('yyyy-MM-dd').format(_selectedDate),
      });
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SavedExamDataPage(savedExamData: savedExamData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 상단 1/3: 흐린 배경과 텍스트
          Expanded(
            flex: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/examination.png',
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.5), // 흐리게 처리
                  colorBlendMode: BlendMode.darken,
                ),
                Center(
                  child: Text(
                    '시험이 오면',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 하단 2/3: 검은 배경과 텍스트 필드 및 날짜 선택기
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '시험',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '어떤 시험인가요?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    controller: _examController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: '시험 이름을 입력하세요',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '시험 보는 날',
                    style: TextStyle(
                      color: Colors.grey, // 회색으로 변경
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(_selectedDate),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _saveExamData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink, // 핑크색으로 변경
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                        ),
                        child: Text(
                          '저장',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // 버튼 간격
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // 메인 페이지로 이동
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, // 회색 배경
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                        ),
                        child: Text(
                          '취소',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SavedExamDataPage extends StatefulWidget {
  final List<Map<String, String>> savedExamData;

  SavedExamDataPage({required this.savedExamData});

  @override
  _SavedExamDataPageState createState() => _SavedExamDataPageState();
}

class _SavedExamDataPageState extends State<SavedExamDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('시험 목록', style: TextStyle(color: Colors.pink)),
      ),
      body: Container(
        color: Colors.black, // 배경을 검정색으로 설정
        child: ListView.builder(
          itemCount: widget.savedExamData.length,
          itemBuilder: (context, index) {
            final exam = widget.savedExamData[index]['exam'];
            final date = widget.savedExamData[index]['date'];
            final examDate = DateFormat('yyyy-MM-dd').parse(date!);
            final daysLeft = examDate.difference(DateTime.now()).inDays;

            return ListTile(
              title: Text(
                '$exam | $date | 디데이: $daysLeft일 남음',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white), // 글씨 색상 흰색으로 설정
              ),
              onTap: () async {
                // 수정 페이지로 이동
              },
            );
          },
        ),
      ),
    );
  }
}

class BirthdayPage extends StatefulWidget {
  @override
  _BirthdayPageState createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  final TextEditingController _nameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<Map<String, String>> savedData = []; // 사용자 정보 저장할 리스트

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveData() {
    setState(() {
      savedData.add({
        'name': _nameController.text,
        'date': DateFormat('yyyy-MM-dd').format(_selectedDate),
        'event': '생일',
      });
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SavedDataPage(savedData: savedData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 상단 1/3: 흐린 배경과 텍스트
          Expanded(
            flex: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/birthday.png',
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.5), // 흐리게 처리
                  colorBlendMode: BlendMode.darken,
                ),
                Center(
                  child: Text(
                    '생일이 오면',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 하단 2/3: 검은 배경과 텍스트 필드 및 날짜 선택기
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '생일',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '누구의 생일인가요?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: '이름을 입력하세요',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '태어난 날',
                    style: TextStyle(
                      color: Colors.grey, // 회색으로 변경
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(_selectedDate),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _saveData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink, // 핑크색으로 변경
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                        ),
                        child: Text(
                          '저장',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // 버튼 간격
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // 메인 페이지로 이동
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, // 회색 배경
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                        ),
                        child: Text(
                          '취소',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SavedDataPage extends StatefulWidget {
  final List<Map<String, String>> savedData;

  SavedDataPage({required this.savedData});

  @override
  _SavedDataPageState createState() => _SavedDataPageState();
}

class _SavedDataPageState extends State<SavedDataPage> {
  // 나이를 계산하는 함수
  int calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('그날이 오면', style: TextStyle(color: Colors.pink)),
      ),
      body: Container(
        color: Colors.black, // 배경을 검정색으로 설정
        child: ListView.builder(
          itemCount: widget.savedData.length,
          itemBuilder: (context, index) {
            final name = widget.savedData[index]['name'];
            final date = widget.savedData[index]['date'];
            final event = widget.savedData[index]['event'];
            final birthDate = DateFormat('yyyy-MM-dd').parse(date!);
            final age = calculateAge(birthDate);

            return ListTile(
              title: Text(
                '$name | $date | $event | $age세',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white), // 글씨 색상 흰색으로 설정
              ),
              onTap: () async {
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditDataPage(
                      savedData: widget.savedData[index],
                    ),
                  ),
                );
                if (updatedData != null) {
                  setState(() {
                    widget.savedData[index] = updatedData; // 리스트에 업데이트된 데이터 반영
                  });
                }
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
      ),
    );
  }
}

class EditDataPage extends StatefulWidget {
  final Map<String, String> savedData;

  EditDataPage({required this.savedData});

  @override
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  late TextEditingController _nameController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.savedData['name']);
    _selectedDate = DateFormat('yyyy-MM-dd').parse(widget.savedData['date']!);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveChanges() {
    Navigator.pop(context, {
      'name': _nameController.text,
      'date': DateFormat('yyyy-MM-dd').format(_selectedDate),
      'event': '생일',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정하기', style: TextStyle(color: Colors.pink)),
      ),
      body: Container(
        color: Colors.black, // 배경을 검정색으로 설정
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: '이름을 입력하세요',
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  DateFormat('yyyy-MM-dd').format(_selectedDate),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // 핑크색으로 변경
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    '저장',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // 수정 페이지에서 나가기
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // 회색 배경
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    '취소',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 회고 : '생일 · 시험 · 커플 · 아기' 기념일을 알려주는 앱을 만드려고 했습니다. 그런데 날짜와 관련된 앱이다 보니 해당 데이터를 저장하는 방법이 어려웠고, 음력도 계산하려고 했는데 시간이 부족해서 추가하지 못 했습니다.
//        그리고 날짜를 잘못 선택해서 저장했을 경우 수정하는 화면에서의 데이터 처리도 어려웠습니다. 또한 기념일을 추가하는 버튼을 추가했는데 이 또한 어려웠습니다.
//        이런 데이터를 활용하여 기념일을 잊지 않게 알려주고, 해당하는 선물을 준비하는 정보와 시험 관련 학원 등을 추천하는 서비스를 자동으로 알려주는 서비스를 추가할 계획입니다.
