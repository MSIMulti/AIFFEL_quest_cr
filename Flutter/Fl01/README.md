# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 임만순, 김우찬,고은비
- 리뷰어 : 이익현 박단영



🔑 **PRT(Peer Review Template)**

- [ ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
  
    완성된 코드를 제출하였다.
flutter: 남은 작업 시간: 17:41 
flutter: 남은 작업 시간: 17:40   
flutter: Pomodoro타이머 종료 가 잘출력됨
- [ ]  **2. 핵심적이거나 복잡하고 이해하기 어려운 부분에 작성된 설명을 보고 해당 코드가 잘 이해되었나요?**
     // 작업과 휴식이 끝나면 새 사이클로 전환
        cycleCount++; // 사이클 카운트 증가
        workTime = 25 * 60; // 작업 시간 25분 초기화
        shortBreakTime = 5 * 60; // 휴식 시간 5분 초기화
       주석이 잘 달려있어서 흐름이 이해가 잘됬다.
- [ ]  **3.** 에러가 난 부분을 디버깅하여 “문제를 해결한 기록”을 남겼나요? 또는
   “새로운 시도 및 추가 실험”을 해봤나요? ****
    GPT를 사용하여 그런부분은 없었다.
- [ ]  **4. 회고를 잘 작성했나요?**
    회고가 잘 작성되있으며 공감이 갔다.   
        
       

- [ ]  **5. 코드가 간결하고 효율적인가요?**
    Pomodoro 타이머 기능이 잘 구현되있다.
void main() {
  int workTime = 25 * 60; // 25분 작업 시간
  int shortBreakTime = 5 * 60; // 5분 휴식 시간
  int longBreakTime = 15 * 60; // 15분 휴식 시간
  int cycleCount = 0; // 사이클 반복 횟수 저장

  Timer.periodic(Duration(seconds: 1), (timer) {
