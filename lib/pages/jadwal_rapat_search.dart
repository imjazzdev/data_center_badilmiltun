import 'package:data_center_badilmiltun/componen/no_data_widget.dart';
import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JadwalRapatSearch extends StatefulWidget {
  const JadwalRapatSearch({super.key});

  @override
  State<JadwalRapatSearch> createState() => _JadwalRapatSearchState();
}

class _JadwalRapatSearchState extends State<JadwalRapatSearch> {
  DateTime? _dateTimeStart = DateTime.now();
  DateTime? _dateTimeEnd = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: NoDataWidget(),
      bottomNavigationBar: Container(
        height: 150,
        padding: EdgeInsets.only(left: 20, right: 20),
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
        decoration: BoxDecoration(
            border: Border.all(color: ColorSelect.blue),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: ColorSelect.blue.withOpacity(0.4),
                  offset: Offset(2, 2),
                  blurRadius: 10)
            ],
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2099),
                ).then((date) {
                  //tambahkan setState dan panggil variabel _dateTime.
                  setState(() {
                    _dateTimeStart = date;
                    print(_dateTimeStart);
                  });
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text('Start', style: TextStyle(fontSize: 18))),
                  Expanded(
                      flex: 4,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  DateFormat('dd-MM-yyyy')
                                      .format(_dateTimeStart!)
                                      .toString(),
                                  style: TextStyle(fontSize: 16)),
                              Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.blueGrey,
                              )
                            ],
                          ))),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2099),
                ).then((date) {
                  //tambahkan setState dan panggil variabel _dateTime.
                  setState(() {
                    _dateTimeEnd = date;
                    print(_dateTimeEnd);
                  });
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        'End',
                        style: TextStyle(fontSize: 18),
                      )),
                  Expanded(
                      flex: 4,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  DateFormat('dd-MM-yyyy')
                                      .format(_dateTimeEnd as DateTime)
                                      .toString(),
                                  style: TextStyle(fontSize: 18)),
                              Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.blueGrey,
                              )
                            ],
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: ,
    );
  }
}
