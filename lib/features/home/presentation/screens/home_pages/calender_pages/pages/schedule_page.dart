import 'package:dynamic_timeline_tile_flutter/dynamic_timeline_tile_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media/commons/constants/dimensions.dart';
import 'package:ringo_media/commons/constants/spacers.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // shrinkWrap: true,
      children: [
        FixedSpacers.spacerH10,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizer.size15,
          ),
          child: DynamicTimelineTileBuilder(
            itemCount: eventData.length,
            itemBuilder: (_, idx) => DynamicTimelineTile(
              // starerChild: [
              //   Icon(Icons.add)
              // ],
              starerDates: [
                eventData[idx]["date"]!,
              ],
              events: [
                EventCard(
                  cardColor: const Color(0xffEBF9F5) ,
                  child: Container(
                    height: ResponsiveDimension.heightPercentage10,
                    decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: Color(0xffFD7722) ,width: 2))
                    ),
                    child: ListTile(
                        title: Text(eventData[idx]["title"]!),
                        subtitle: Text(eventData[idx]["description"]!)),
                  ),
                )
              ],
            ),
          ),
        ),
        FixedSpacers.spacerH20,
      ],
    );
  }
}

final List<Map<String, String>> eventData = [
  {
    "title": "Title",
    "description": "This is a content description for 12 jan",
    "date": "2 Jan",
  },
  {
    "title": "Title",
    "description": "This is a content description for 13 jan",
    "date": "13 Jan",
  },
  {
    "title": "Title",
    "description": "This is a content description for 14 jan",
    "date": "9:00",
  },
  {
    "title": "Title",
    "description": "This is a content description for 15 jan",
    "date": "15 Jan",
  },
  {
    "title": "Title",
    "description": "This is a content description for 15 jan",
    "date": "15 Jan",
  },

];
