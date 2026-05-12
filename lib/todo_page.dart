import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  // 체크 상태
  bool isSwiftDone = false;
  bool isMeetingDone = false;
  bool isStudyDone = false;

  // 제목 입력 컨트롤러
  final TextEditingController swiftTitleController =
  TextEditingController(text: "Swift 복습");

  final TextEditingController meetingTitleController =
  TextEditingController(text: "회의");

  final TextEditingController studyTitleController =
  TextEditingController(text: "자격증 공부");

  // 설명 입력 컨트롤러
  final TextEditingController swiftTimeController =
  TextEditingController(text: "오후 6:00 ~ 8:00");

  final TextEditingController meetingTimeController =
  TextEditingController(text: "오후 7:00 ~ 11:00");

  final TextEditingController studyTimeController =
  TextEditingController(text: "오후 2:00 ~ 5:00");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              const Text(
                "Todo",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "2026년 4월",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDateCard("13", "월", false),
                  _buildDateCard("14", "화", false),
                  _buildDateCard("15", "수", true),
                  _buildDateCard("16", "목", false),
                  _buildDateCard("17", "금", false),
                  _buildDateCard("18", "토", false),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "To-do",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Swift 복습
              _buildTodoCard(
                color: const Color(0xFFDCE5F5),

                titleController: swiftTitleController,
                timeController: swiftTimeController,

                isDone: isSwiftDone,

                onTap: () {
                  setState(() {
                    isSwiftDone = !isSwiftDone;
                  });
                },
              ),

              const SizedBox(height: 15),

              // 회의
              _buildTodoCard(
                color: const Color(0xFFF4DDE2),

                titleController: meetingTitleController,
                timeController: meetingTimeController,

                isDone: isMeetingDone,

                onTap: () {
                  setState(() {
                    isMeetingDone = !isMeetingDone;
                  });
                },
              ),

              const SizedBox(height: 15),

              // 자격증 공부
              _buildTodoCard(
                color: const Color(0xFFF6F0C8),

                titleController: studyTitleController,
                timeController: studyTimeController,

                isDone: isStudyDone,

                onTap: () {
                  setState(() {
                    isStudyDone = !isStudyDone;
                  });
                },
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: const Color(0xFFE7E3FA),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Text(
                  "일정이 없습니다.\nAI에게 추천받으세요.",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // 날짜 카드
  Widget _buildDateCard(
      String day,
      String week,
      bool selected,
      ) {

    return Container(
      width: 42,
      height: 60,

      decoration: BoxDecoration(
        color: selected
            ? Colors.deepPurpleAccent
            : Colors.grey[200],

        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            week,
            style: TextStyle(
              fontSize: 12,
              color: selected
                  ? Colors.white
                  : Colors.black54,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            day,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selected
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Todo 카드
  Widget _buildTodoCard({
    required Color color,
    required TextEditingController titleController,
    required TextEditingController timeController,
    required bool isDone,
    required VoidCallback onTap,
  }) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 제목 입력
                TextField(
                  controller: titleController,

                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "일정 제목 입력",
                  ),

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                // 설명 입력
                TextField(
                  controller: timeController,

                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "시간 및 설명 입력",
                  ),

                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // 체크박스
          GestureDetector(
            onTap: onTap,

            child: Container(
              width: 28,
              height: 28,

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 2,
                ),

                borderRadius: BorderRadius.circular(6),

                color: isDone
                    ? Colors.deepPurple
                    : Colors.transparent,
              ),

              child: isDone
                  ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 18,
              )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}