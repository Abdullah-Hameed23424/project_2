import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/core/theme/app_theme.dart';

class PickingDateTime extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController timeController;

  const PickingDateTime({
    super.key,
    required this.dateController,
    required this.timeController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Date', style: context.bodyMedium16),
              TextField(
                readOnly: true,
                controller: dateController,
                decoration: InputDecoration(
                  hintText: 'yyyy-mm-dd',
                  prefixIcon: const Icon(Icons.calendar_today_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    initialDate: DateTime.now(),
                  );

                  if (date != null) {
                    dateController.text =
                        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                  }
                },
              ),
            ],
          ),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Time', style: context.bodyMedium16),
              TextField(
                readOnly: true,
                controller: timeController,
                decoration: InputDecoration(
                  hintText: '--:-- --',
                  prefixIcon: const Icon(Icons.access_time_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (time != null) {
                    final hour = time.hourOfPeriod == 0
                        ? 12
                        : time.hourOfPeriod;
                    final minute = time.minute.toString().padLeft(2, '0');
                    final period = time.period == DayPeriod.am ? 'AM' : 'PM';

                    timeController.text = '$hour:$minute $period';
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
