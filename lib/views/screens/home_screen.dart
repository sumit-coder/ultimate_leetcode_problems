import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Container(
        width: double.maxFinite,
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
                      TableCell(text: list['title']),
                      Row(children: [ListCodeWidget(title: list['code'])]),
                    ]),
                ],
              ),
            ),

            Container(
              constraints: const BoxConstraints(maxWidth: 1100),
              // color: Colors.white,
              // padding: EdgeInsets.all(20.0),
              child: Table(
                border: TableBorder.all(color: Colors.grey.shade800),
                columnWidths: const {
                  0: FlexColumnWidth(0.5),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(1.5),
                  3: FlexColumnWidth(1.5),
                  4: FlexColumnWidth(3),
                },
                children: const [
                  // Table Head Row
                  TableRow(
                    decoration: BoxDecoration(),
                    children: [
                      TableHeadCell(text: 'No'),
                      TableHeadCell(text: 'Title'),
                      TableHeadCell(text: 'Url'),
                      TableHeadCell(text: 'Solutions'),
                      TableHeadCell(text: 'From Lists'),
                    ],
                  ),
                  TableRow(children: [
                    TableCell(text: '1'),
                    TableCell(text: 'Two Sum'),
                    TableCell(text: 'Leetcode'),
                    TableCell(text: 'Solution'),
                    // TableCell(text: 'TOP150asdfa sdfas dfasd fasdf asdf asdf asd fasdf'),
                    Wrap(
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
            )
          ],
        ),
      ),
    );
  }
}

class TableCell extends StatelessWidget {
  const TableCell({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey.shade50),
      ),
    );
  }
}

class TableHeadCell extends StatelessWidget {
  const TableHeadCell({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey.shade50, fontWeight: FontWeight.bold),
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
