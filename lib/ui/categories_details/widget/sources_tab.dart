import 'package:flutter/material.dart';
import 'package:news/data/model/sourceResponses/Source.dart';


class SourcesTabWidget extends StatelessWidget {
  final Source source;
  const SourcesTabWidget({super.key,required this.source});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 7, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                width: 3,
                color:
                Theme.of(context).colorScheme.primary)),
        child: Text(source.name??''),
      ),
    );
  }
}
