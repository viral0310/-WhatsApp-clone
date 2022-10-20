import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_ui/utils/textstyle.dart';

import '../../../../models/android_models/android_model.dart';
import '../../../../models/ios_models/ios_model.dart';
import '../../../../utils/color.dart';

class CupertinoCallsScreen extends StatefulWidget {
  const CupertinoCallsScreen({Key? key}) : super(key: key);

  @override
  State<CupertinoCallsScreen> createState() => _CupertinoCallsScreenState();
}

class _CupertinoCallsScreenState extends State<CupertinoCallsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Edit',
            style: cupertinoBlueText,
          ),
        ),
        middle: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              alignment: const Alignment(0.7, 0),
              child: const Text(
                'Missed',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'All',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),
                height: 25,
                width: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
        trailing: const Icon(CupertinoIcons.phone_fill_badge_plus),
      ),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 0.3)),
          height: 900,
          child: ListView.separated(
            padding:
                const EdgeInsets.only(right: 20, left: 15, top: 10, bottom: 50),
            itemBuilder: (context, i) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: NetworkImage('${chatsData[i].img}'),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${chatsData[i].name}',
                            style: cupertinoName,
                          ),
                          const SizedBox(height: 3),
                          Row(
                            children: [
                              (cupCallsData[i].isCall)
                                  ? const Icon(
                                      CupertinoIcons.phone_fill,
                                      size: 15,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      CupertinoIcons.video_camera_solid,
                                      size: 15,
                                      color: Colors.grey,
                                    ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                '${cupCallsData[i].status}',
                                style: cupertinoTime,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${cupCallsData[i].date}',
                            style: cupertinoTime,
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            CupertinoIcons.exclamationmark_circle,
                            color: cupertinoMainColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (context, i) {
              return const Divider(
                height: 20,
                indent: 60,
              );
            },
            itemCount: cupCallsData.length,
          ),
        ),
      ),
    );
  }
}
