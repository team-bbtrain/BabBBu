import 'package:BabBBu/ui/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpirationDatePickerPage extends StatefulWidget {
  const ExpirationDatePickerPage({super.key});

  @override
  _ExpirationDatePickerPageState createState() =>
      _ExpirationDatePickerPageState();
}

class _ExpirationDatePickerPageState extends State<ExpirationDatePickerPage> {
  DateTime? _selectedDate;
  TextEditingController _dateController = TextEditingController(); // 선택된 날짜 표시

  // calendar.dart 사용법
  Future<void> _showDatePicker() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return CustomCalendarWidget(
          initialDate: _selectedDate ?? DateTime.now(),
          onDateSelected: (DateTime selectedDate) {
            setState(() {
              _selectedDate = selectedDate;
              _dateController.text =
                  DateFormat('yyyy.MM.dd').format(selectedDate);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("물품 등록")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "기부하려는 물품의 유통기한을 입력해 주세요",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _showDatePicker, // TextField 클릭 시 calendar 모달 열기
              child: AbsorbPointer(
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    hintText: "유통기한을 선택해 주세요.",
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // 다음 버튼
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 48),
              ),
              child: Text("다음", style: TextStyle(color: Colors.white)),
              onPressed: () {
                // '다음' 버튼 동작
              },
            ),
          ],
        ),
      ),
    );
  }
}
