import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homeserve/pages/user/home.dart';
import 'package:homeserve/themes/themes.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

import '../../services/firestore.dart';

class Datetime extends StatefulWidget {
  Datetime({Key? key, required this.map}) : super(key: key);

  Map map = {};

  @override
  State<Datetime> createState() => _DatetimeState();
}

class _DatetimeState extends State<Datetime> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  bool booked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.map['name'],
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.map['service'],
                style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Themes.basic,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      (widget.map['rating']).toString(),
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const Text("Date:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    DateFormat.yMMMd().format(selectedDate),
                    style: const TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 41, 40, 40)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: const Icon(Icons.calendar_month),
                    onTap: () async {
                      DateTime? date = await showRoundedDatePicker(
                        context: context,
                        background: Colors.white,
                        firstDate:
                            DateTime(DateTime.now().year, DateTime.now().month),
                        styleDatePicker: MaterialRoundedDatePickerStyle(
                            textStyleButtonPositive:
                                TextStyle(color: Themes.basic),
                            textStyleButtonNegative:
                                TextStyle(color: Themes.basic),
                            textStyleDayOnCalendarDisabled:
                                const TextStyle(color: Colors.black54),
                            paddingMonthHeader: const EdgeInsets.only(top: 13),
                            textStyleDayButton: const TextStyle(
                                fontSize: 23, color: Colors.white)),
                        theme: ThemeData(
                          primaryColor: Themes.basic,
                          accentColor: Themes.basic,
                          dialogBackgroundColor: Colors.white,
                          textTheme: TextTheme(
                              caption: const TextStyle(color: Colors.grey),
                              overline: TextStyle(color: Themes.basic)),
                        ),
                      );
                      if (date != null) {
                        setState(() {
                          selectedDate = date;
                        });
                      }
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                const Text("Time:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "  ${selectedTime.hour.toString()}:${selectedTime.minute.toString()} ${(selectedTime.period.toString()).substring((selectedTime.period.toString()).length - 2).toUpperCase()}",
                  style: const TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 41, 40, 40)),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    child: const Icon(Icons.access_time_outlined),
                    onTap: () async {
                      TimeOfDay? time = await showRoundedTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          theme: ThemeData(
                              accentColor: Themes.basic,
                              primaryColor: Themes.basic,
                              indicatorColor: Themes.basic));

                      if (time != null) {
                        setState(() {
                          selectedTime = time;
                        });
                      }
                    })
              ]),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    booked = true;
                    const snackBar = SnackBar(
                      content: Text('Booking request sent.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    setState(() {
                      booked = true;
                    });
                    Database.bookService(
                        widget.map, selectedDate, selectedTime);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(306, 45),
                      primary: Themes.basic,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  child: const Text("Book Service")),
              const SizedBox(
                height: 240,
              ),
              booked
                  ? GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserHome()));
                      }),
                      child: Text(
                        "Go Home?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Themes.basic),
                      ),
                    )
                  : const SizedBox(
                      height: 50,
                    )
            ],
          )),
    );
  }
}
