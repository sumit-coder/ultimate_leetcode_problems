import 'package:flutter/material.dart';

class TextTableCell extends StatelessWidget {
  const TextTableCell({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

class WidgetTableCell extends StatelessWidget {
  const WidgetTableCell({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: widget,
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
