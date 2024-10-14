import 'dart:async';

void main() {
  int workTime = 25 * 60; // 25분
  int shortBreakTime = 5 * 60; // 5분
  int longBreakTime = 15 * 60; // 15분
  int cycleCount = 0;

  Timer.periodic(Duration(seconds: 1), (timer) {
    if (cycleCount < 4) {
      if (workTime > 0) {
        print(
            '작업 시간: ${workTime ~/ 60}:${(workTime % 60).toString().padLeft(2, '0')}');
        workTime--;
      } else if (shortBreakTime > 0) {
        print(
            '휴식 시간: ${shortBreakTime ~/ 60}:${(shortBreakTime % 60).toString().padLeft(2, '0')}');
        shortBreakTime--;
      } else {
        cycleCount++;
        workTime = 25 * 60; // 다시 작업 시간 초기화
        shortBreakTime = 5 * 60; // 다시 휴식 시간 초기화
        print('새 작업 사이클 시작');
      }
    } else {
      if (longBreakTime > 0) {
        print(
            '긴 휴식 시간: ${longBreakTime ~/ 60}:${(longBreakTime % 60).toString().padLeft(2, '0')}');
        longBreakTime--;
      } else {
        print('Pomodoro 타이머 종료');
        timer.cancel();
      }
    }
  });
}
