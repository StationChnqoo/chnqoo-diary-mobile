import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:chnqoo_diary_mobile/widgets/my_tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  final String date;
  final onDateChanged;
  const DateSelector(
      {super.key, required this.date, required this.onDateChanged});

  @override
  State<StatefulWidget> createState() => DateSelectorState();
}

class DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyCard(
        child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.event,
                color: Theme.of(context).primaryColor,
                size: 18,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '日期',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          Row(
            children: [
              MyTag(
                onPress: () {
                  widget.onDateChanged(x.useDiffDate(-1));
                },
                isActive: x.useDiffDate(-1) == widget.date,
                text: '昨天',
              ),
              SizedBox(
                width: 8,
              ),
              MyTag(
                onPress: () {
                  widget.onDateChanged(x.useDiffDate(0));
                },
                isActive: x.useDiffDate(0) == widget.date,
                text: '今天',
              ),
              SizedBox(
                width: 12,
              ),
              MyIconButton(
                onPress: () async {
                  print("${x.useDiffDate(-1)} -> ${x.useDiffDate(0)}");
                  var _date = await showDatePicker(
                    context: context,
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    firstDate: DateTime(1949, 10, 1),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    builder: (context, child) {
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Container(
                              height: 480.w,
                              width: 360.w,
                              child: child,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                  print("DatePicker date: ${_date}");
                  if (_date != null) {
                    widget
                        .onDateChanged(DateFormat('yyyy-MM-dd').format(_date));
                  }
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: Text(
                  //         '请选择日期',
                  //         style: TextStyle(
                  //             fontSize: 18, fontWeight: FontWeight.w500),
                  //       ),
                  //       content: Container(
                  //           height: 158.w,
                  //           child: CupertinoTheme(
                  //               data: CupertinoThemeData(
                  //                   textTheme: CupertinoTextThemeData(
                  //                       dateTimePickerTextStyle:
                  //                           TextStyle(fontSize: 16))),
                  //               child: CupertinoDatePicker(
                  //                 mode: CupertinoDatePickerMode.date,
                  //                 minimumDate: DateTime(1949, 10, 1),
                  //                 maximumDate:
                  //                     DateTime.now().add(Duration(minutes: 1)),
                  //                 onDateTimeChanged: (DateTime newDateTime) {
                  //                   // Do something with the selected time
                  //                   widget.onDateChanged(
                  //                       DateFormat('yyyy-MM-dd')
                  //                           .format(newDateTime));
                  //                 },
                  //               ))),
                  //       actions: [
                  //         CupertinoDialogAction(
                  //           child: Text(
                  //             '取消',
                  //             style: TextStyle(color: Colors.black54),
                  //           ),
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //         ),
                  //         CupertinoDialogAction(
                  //           child: Text(
                  //             '确定',
                  //             style: TextStyle(
                  //                 color: Theme.of(context).primaryColor),
                  //           ),
                  //           onPressed: () {
                  //             setState(() {});
                  //             Navigator.of(context).pop();
                  //           },
                  //         )
                  //       ],
                  //     );
                  //   },
                  // );
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black54,
                  size: 16,
                ),
                reverse: true,
                text: Text(
                  widget.date == x.useDiffDate(-1) ||
                          widget.date == x.useDiffDate(0)
                      ? '更多日期'
                      : widget.date,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant DateSelector oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }
}
