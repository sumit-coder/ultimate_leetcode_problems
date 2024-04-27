import 'package:flutter/material.dart';

import 'widgets/table_cell_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> listOfDiffLists = [
    {'title': 'Leetcode 75', 'code': 'LC75', 'url': ''},
    {'title': 'Leetcode 150', 'code': 'LC150', 'url': ''},
    {'title': 'Leetcode Top Liked 100', 'code': 'LCL100', 'url': ''},
    {'title': 'Neetcode 75 & 150', 'code': 'NC75&150', 'url': ''},
    {'title': 'Sean 180 by Topic', 'code': 'SEAN180', 'url': ''},
    {'title': 'Original Blind 75', 'code': 'BLIND75', 'url': ''},
    {'title': 'Cracking The Coding Interview Book 5th 189', 'code': 'CTCI189', 'url': ''},
  ];

  List<Map> listOfProblemsTopicWise = [
    {
      'topicTitle': 'Queue',
      'problems': [
        "https://leetcode.com/problems/number-of-recent-calls/",
        "https://leetcode.com/problems/dota2-senate/",
      ],
    },
    {
      'topicTitle': 'Intervals',
      'problems': [
        "https://leetcode.com/problems/summary-ranges/",
        "https://leetcode.com/problems/merge-intervals/",
        "https://leetcode.com/problems/insert-interval/",
        "https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/",
        "https://leetcode.com/problems/non-overlapping-intervals/",
        "https://leetcode.com/problems/meeting-rooms/",
        "https://leetcode.com/problems/meeting-rooms-ii/",
        "https://leetcode.com/problems/minimum-interval-to-include-each-query/"
      ],
    },
    {
      'topicTitle': 'Prefix Sum',
      'problems': [
        "https://leetcode.com/problems/find-the-highest-altitude/",
        "https://leetcode.com/problems/find-pivot-index/",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Combined Lists Guide
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                color: Colors.grey.shade900,
                padding: const EdgeInsets.all(16.0),
                child: Table(
                  border: TableBorder.all(color: Colors.grey.shade800),
                  columnWidths: const {
                    0: FlexColumnWidth(4),
                    1: FlexColumnWidth(1),
                  },
                  children: [
                    // Table Head Row
                    const TableRow(decoration: BoxDecoration(), children: [
                      TableHeadCell(text: 'Title'),
                      TableHeadCell(text: 'ListCode'),
                    ]),
                    // Build UI From the list of Combined lists
                    for (Map list in listOfDiffLists)
                      TableRow(children: [
                        TextTableCell(text: list['title']),
                        Row(children: [ListCodeWidget(title: list['code'])]),
                      ]),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade800,
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listOfProblemsTopicWise.length,
                  itemBuilder: (context, index) {
                    return Container(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      // color: Colors.white,
                      // padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              listOfProblemsTopicWise[index]['topicTitle'],
                              style: const TextStyle(color: Colors.grey, fontSize: 24),
                            ),
                          ),
                          Table(
                            border: TableBorder.all(color: Colors.grey.shade800),
                            columnWidths: const {
                              0: FlexColumnWidth(0.5),
                              1: FlexColumnWidth(0.7),
                              2: FlexColumnWidth(4),
                              3: FlexColumnWidth(1.5),
                              4: FlexColumnWidth(1.5),
                              5: FlexColumnWidth(3),
                            },
                            children: [
                              // Table Head Row
                              const TableRow(
                                decoration: BoxDecoration(),
                                children: [
                                  TableHeadCell(text: 'No'),
                                  TableHeadCell(text: 'Done'),
                                  TableHeadCell(text: 'Title'),
                                  TableHeadCell(text: 'Url'),
                                  TableHeadCell(text: 'Solutions'),
                                  TableHeadCell(text: 'From Lists'),
                                ],
                              ),
                              // Table Data Row 1 - length of problems
                              for (var problem in listOfProblemsTopicWise[index]['problems'] as List)
                                TableRow(children: [
                                  const TextTableCell(text: '1'),
                                  WidgetTableCell(widget: Checkbox(value: true, onChanged: (bool? newVal) {})),
                                  TextTableCell(text: problem),
                                  const TextTableCell(text: 'Leetcode'),
                                  const TextTableCell(text: 'Solution'),
                                  const Wrap(
                                    children: [
                                      ListCodeWidget(title: 'LC75'),
                                      ListCodeWidget(title: 'LC150'),
                                      ListCodeWidget(title: 'NC75&150'),
                                      ListCodeWidget(title: 'LC75'),
                                      ListCodeWidget(title: 'LC75'),
                                      ListCodeWidget(title: 'LC75'),
                                      ListCodeWidget(title: 'LC75'),
                                    ],
                                  )
                                ])
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListCodeWidget extends StatelessWidget {
  const ListCodeWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromARGB(255, 20, 19, 19),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
          height: 1,
        ),
      ),
    );
  }
}
