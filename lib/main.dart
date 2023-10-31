import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: 100,
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          height: 100,
                          color: Colors.white,
                          child: SfRadialGauge(
                            enableLoadingAnimation: true,
                            axes: <RadialAxis>[
                              RadialAxis(
                                startAngle: 170,
                                endAngle: 10,
                                radiusFactor: 1.25,
                                canScaleToFit: true,
                                showTicks: false,
                                axisLabelStyle:
                                    GaugeTextStyle(color: Colors.transparent),
                                ranges: <GaugeRange>[
                                  GaugeRange(
                                    startValue: 0,
                                    endValue: 20,
                                    color: Colors.redAccent,
                                    startWidth: 15,
                                    endWidth: 15,
                                  ),
                                  GaugeRange(
                                    startValue: 20,
                                    endValue: 60,
                                    color: Colors.yellow,
                                    startWidth: 15,
                                    endWidth: 15,
                                  ),
                                  GaugeRange(
                                    startValue: 60,
                                    endValue: 100,
                                    color: Colors.greenAccent,
                                    startWidth: 15,
                                    endWidth: 15,
                                  ),
                                ],
                                pointers: const <GaugePointer>[
                                  NeedlePointer(
                                      value: 65,
                                      needleLength: 0.65,
                                      enableAnimation: true,
                                      animationType: AnimationType.ease,
                                      needleStartWidth: 1,
                                      needleEndWidth: 10,
                                      needleColor: Colors.black54,
                                      // tailStyle: TailStyle(
                                      //   gradient: LinearGradient(
                                      //       colors: [Colors.grey, Colors.grey]),
                                      // ),
                                      knobStyle: KnobStyle(
                                          color: Colors.black54,
                                          knobRadius: 0.15,
                                          borderColor: Colors.grey,
                                          borderWidth: 0.05)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Productivity Meter",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "Poor",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 18),
                                  Text(
                                    "Avrage",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.amberAccent,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 18),
                                  Text(
                                    "Good",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.greenAccent,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                      Container(
                        color: Colors.grey[100],
                        margin: const EdgeInsets.all(20),
                        child:  Center(
                            child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Total Working Hours: 172",
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                        )),
                      )
                    ]),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: CalendarCarousel<Event>(
                todayBorderColor: Colors.transparent,
                onDayPressed: (date, events) {
                  setState(() => _currentDate2 = date);
                },
                daysHaveCircularBorder: false,
                showOnlyCurrentMonthDate: false,
                weekendTextStyle:  GoogleFonts.poppins(color: Colors.black),
                // childAspectRatio: 1,
                weekdayTextStyle:  GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w600),
                weekDayFormat: WeekdayFormat.weekdays,
                thisMonthDayBorderColor: Colors.transparent,
                weekFormat: false,
                // markedDatesMap: _markedDateMap,
                height: MediaQuery.sizeOf(context).height - 120,
                width: MediaQuery.sizeOf(context).width,
                selectedDateTime: _currentDate2,
                // targetDateTime: _targetDateTime,
                selectedDayButtonColor: Colors.transparent,
                selectedDayBorderColor: Colors.transparent,
                childAspectRatio: 1.5,
                customDayBuilder: (
                  /// you can provide your own build function to make custom day containers
                  bool isSelectable,
                  int index,
                  bool isSelectedDay,
                  bool isToday,
                  bool isPrevMonthDay,
                  TextStyle textStyle,
                  bool isNextMonthDay,
                  bool isThisMonthDay,
                  DateTime day,
                ) {
                  /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                  /// This way you can build custom containers for specific days only, leaving rest as default.

                  // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                  if (day.day == 4) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.redAccent.withOpacity(0.1),
                          border: const Border(
                              left: BorderSide(
                                  color: Colors.redAccent, width: 0.0),
                              right: BorderSide(
                                  color: Colors.redAccent, width: 0.0),
                              top: BorderSide(
                                  color: Colors.redAccent, width: 0.0),
                              bottom: BorderSide(
                                  color: Colors.redAccent, width: 8))),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                day.day.toString(),
                                style:  GoogleFonts.poppins(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                               Text(
                                "Leave",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ),
                    );
                  } else if (day.day == 10) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blueAccent.withOpacity(0.1),
                          border: Border(
                              left: BorderSide(
                                  color: Colors.blue[900]!, width: 0.0),
                              right: BorderSide(
                                  color: Colors.blue[900]!, width: 0.0),
                              top: BorderSide(
                                  color: Colors.blue[900]!, width: 0.0),
                              bottom: BorderSide(
                                  color: Colors.blue[900]!, width: 8))),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                day.day.toString(),
                                style:  GoogleFonts.poppins(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Sick Leave",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ),
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.greenAccent.withOpacity(0.1),
                          border: const Border(
                              left: BorderSide(
                                  color: Colors.greenAccent, width: 0.0),
                              right: BorderSide(
                                  color: Colors.greenAccent, width: 0.0),
                              top: BorderSide(
                                  color: Colors.greenAccent, width: 0.0),
                              bottom: BorderSide(
                                  color: Colors.greenAccent, width: 8))),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                day.day.toString(),
                                style:  GoogleFonts.poppins(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                               Text(
                                "Persent",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ),
                    );
                  }
                },
                markedDateCustomShapeBorder: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent)),
                markedDateCustomTextStyle:  GoogleFonts.poppins(color: Colors.black),
                dayPadding: 4.0,
                showHeader: false,
                todayTextStyle:  GoogleFonts.poppins(color: Colors.black),
                minSelectedDate:
                    _currentDate.subtract(const Duration(days: 360)),
                maxSelectedDate: _currentDate.add(const Duration(days: 360)),
                prevMonthDayBorderColor: Colors.transparent,
                nextMonthDayBorderColor: Colors.transparent,
                prevDaysTextStyle:  GoogleFonts.poppins(color: Colors.black),
                inactiveDaysTextStyle:  GoogleFonts.poppins(color: Colors.black),

                onCalendarChanged: (DateTime date) {
                  debugPrint('On Calendar Changed date $date');
                },
                onDayLongPressed: (DateTime date) {
                  debugPrint('long pressed date $date');
                },
              ),
            ),
          ],
        ));
  }

  String getWeekdayNameFromInteger(int dayInteger) {
    List<String> weekdays = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ];

    if (dayInteger >= 1 && dayInteger <= 7) {
      return weekdays[dayInteger - 1];
    } else {
      return "Invalid input";
    }
  }
}
