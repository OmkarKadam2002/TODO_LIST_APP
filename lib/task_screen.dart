import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Taskscreen extends StatefulWidget {
  //Taskscreen({super.key});
  const Taskscreen({Key? key}) : super(key: key);

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;
    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {};
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEventDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                'Add a New Task',
                textAlign: TextAlign.center,
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'Task Title',
                    ),
                  ),
                  TextField(
                    controller: descpController,
                    textCapitalization: TextCapitalization.words,
                    decoration:
                        const InputDecoration(labelText: ' Task Description'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                    child: const Text('Add Event'),
                    onPressed: () {
                      if (titleController.text.isEmpty &&
                          descpController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Required title and description'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        //Navigator.pop(context);
                        return;
                      } else {
                        if (mySelectedEvents[DateFormat('yyyy-MM-dd')
                                .format(_selectedDate!)] !=
                            null) {
                          mySelectedEvents[DateFormat('yyyy-MM-dd')
                                  .format(_selectedDate!)]
                              ?.add({
                            "eventTitle": titleController.text,
                            "eventDescp": descpController.text,
                          });
                        } else {
                          mySelectedEvents[DateFormat('yyyy-MM-dd')
                              .format(_selectedDate!)] = [
                            {
                              "eventTitle": titleController.text,
                              "eventDescp": descpController.text,
                            }
                          ];
                        }
                        print(
                            "New Event for backend developer ${json.encode(mySelectedEvents)}");
                        titleController.clear();
                        descpController.clear();
                        Navigator.pop(context);
                        return;
                      }
                    })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 42, 47, 79),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '𝓛𝓲𝓼𝓽𝓲𝓯𝔂 ',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ]),
        ),
        SizedBox(height: 10),
        TableCalendar(
          firstDay: DateTime.utc(2010, 1, 1),
          lastDay: DateTime.utc(2030, 1, 1),
          focusedDay: DateTime.now(),
          calendarFormat: _calendarFormat,
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDate, selectedDay)) {
              setState(() {
                _selectedDate = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDate, day);
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          eventLoader: _listOfDayEvents,
        ),
        ..._listOfDayEvents(_selectedDate!).map(
          (myEvents) => ListTile(
            leading: const Icon(
              Icons.done,
              color: Colors.teal,
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Event Title:   ${myEvents['eventTitle']}'),
            ),
            subtitle: Text('Description:   ${myEvents['eventDescp']}'),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add, color: Colors.white),
        onPressed: () => _showAddEventDialog(),
        label: const Text('Add Event',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 145, 127, 179),
      ),
      backgroundColor: Color.fromARGB(255, 253, 226, 243),
    );
  }
}
