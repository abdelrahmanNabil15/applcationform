import 'package:flutter/material.dart';
import 'package:project_a/utils/Database.dart';
import 'package:project_a/widgets/app_bar_title.dart';

class DetailsScreen extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentId;

  DetailsScreen({
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId,
  });

  @override
  _detailsScreenState createState() => _detailsScreenState();
}

class _detailsScreenState extends State<DetailsScreen> {
  final FocusNode _NameFocusNode = FocusNode();
  final FocusNode _applyforFocusNode = FocusNode();
  final FocusNode _birthdayFocusNode = FocusNode();
  final FocusNode _ParentFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _NameFocusNode.unfocus();
        _applyforFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:Colors.white,
          title: AppBarTitle(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Text(widget.currentTitle,style: TextStyle(color: Colors.black), ),

            ),

          ),
        ),
      );

  }
}