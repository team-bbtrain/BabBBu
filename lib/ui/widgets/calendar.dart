import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart'; // 날짜 포맷용 패키지

class CustomCalendarWidget extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;
  final DateTime initialDate;

  CustomCalendarWidget({
    required this.onDateSelected,
    required this.initialDate,
  });

  @override
  _CustomCalendarWidgetState createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget> {
  late DateTime focusedDate;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    focusedDate = widget.initialDate;
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final firstDayOfMonth = DateTime(focusedDate.year, focusedDate.month, 1);
    final lastDayOfMonth = DateTime(focusedDate.year, focusedDate.month + 1, 0);
    final startDayOfWeek = firstDayOfMonth.weekday % 7;

    final lastMonthLastDay =
        DateTime(focusedDate.year, focusedDate.month, 0).day;
    const totalCells = 42; // 6주(7 * 6 = 42일)을 채워 모든 날을 표시

    return Container(
      padding: const EdgeInsets.all(16.0),
      height: screenHeight * 0.8, // 모달 높이 설정
      child: Column(
        children: [
          // 상단 회색 선
          Container(
            width: 70,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.text50,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 25),
          Text(
            '날짜 선택',
            style: textTheme.titleSmall,
          ),
          SizedBox(height: 10),
          Divider(
            thickness: 0.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Transform.rotate(
                  angle: 3.14 * -90 / 180.0,
                  child: SvgPicture.asset(
                    AppAssets.icons.arrowLine2,
                  ),
                ), // 이전 달 화살표
                onPressed: () {
                  setState(() {
                    focusedDate =
                        DateTime(focusedDate.year, focusedDate.month - 1);
                  });
                },
              ),
              Text(
                DateFormat('yyyy.MM').format(focusedDate),
                style: textTheme.titleSmall,
              ),
              IconButton(
                icon: Transform.rotate(
                  angle: 3.14 * 90 / 180.0,
                  child: SvgPicture.asset(
                    AppAssets.icons.arrowLine2,
                  ),
                ), // 다음 달 화살표
                onPressed: () {
                  setState(() {
                    focusedDate =
                        DateTime(focusedDate.year, focusedDate.month + 1);
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          // 요일 표시
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['일', '월', '화', '수', '목', '금', '토']
                .map((day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: textTheme.labelMedium,
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 10),
          // 날짜 선택 그리드 (스크롤 없이 모든 날짜를 표시)
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(), // 스크롤 금지
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, // 일주일 7일
                crossAxisSpacing: 4, // 일자 간 간격
                mainAxisSpacing: 4, // 행 간 간격
                childAspectRatio:
                    screenWidth / (screenHeight * 0.5), // 높이와 비율을 조정
              ),
              itemCount: totalCells, // 총 42개의 셀(6주치) 표시
              itemBuilder: (BuildContext context, int index) {
                DateTime currentDate;

                // 이전 달 날짜 처리
                if (index < startDayOfWeek) {
                  currentDate = DateTime(
                      focusedDate.year,
                      focusedDate.month - 1,
                      lastMonthLastDay - startDayOfWeek + index + 1);
                }
                // 해당 월 날짜 처리
                else if (index < startDayOfWeek + lastDayOfMonth.day) {
                  currentDate = DateTime(focusedDate.year, focusedDate.month,
                      index - startDayOfWeek + 1);
                }
                // 다음 달 날짜 처리
                else {
                  currentDate = DateTime(
                      focusedDate.year,
                      focusedDate.month + 1,
                      index - startDayOfWeek - lastDayOfMonth.day + 1);
                }

                bool isCurrentMonth = currentDate.month == focusedDate.month;
                bool isSelected = selectedDate?.day == currentDate.day &&
                    selectedDate?.month == currentDate.month &&
                    selectedDate?.year == currentDate.year;

                return GestureDetector(
                  onTap: isCurrentMonth
                      ? () {
                          setState(() {
                            selectedDate = currentDate;
                          });
                        }
                      : null, // 해당 월이 아닌 날짜는 선택 불가
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? colorScheme.primary : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "${currentDate.day}",
                        style: textTheme.labelSmall!.copyWith(
                          color: isCurrentMonth
                              ? (isSelected
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurface)
                              : AppColors.text50,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: screenWidth * 0.9, // 버튼 너비를 전체 화면의 90%로 설정
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: colorScheme.onPrimary,
                backgroundColor: colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 15), // 버튼 높이 설정
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('완료'),
              onPressed: () {
                if (selectedDate != null) {
                  widget.onDateSelected(selectedDate!);
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
