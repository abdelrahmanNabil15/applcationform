import 'package:flutter/material.dart';
import 'package:project_a/widgets/add_item_form.dart';
import 'package:project_a/widgets/add_item_form_forMob.dart';
import 'package:project_a/widgets/app_bar_title.dart';

import '../Responsive.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _NameFocusNode = FocusNode();
  final FocusNode _applyforFocusNode = FocusNode();
  final FocusNode _birthdayFocusNode = FocusNode();
  final FocusNode _ParentFocusNode = FocusNode();
  final FocusNode _AddressFocusNode = FocusNode();
  final FocusNode _EmailFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _countryFocusNode = FocusNode();

  final FocusNode _phoneNumberFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _NameFocusNode.unfocus();
        _applyforFocusNode.unfocus();
        _birthdayFocusNode.unfocus();
        _ParentFocusNode.unfocus();
        _AddressFocusNode.unfocus();
        _EmailFocusNode.unfocus();
        _cityFocusNode.unfocus();
        _countryFocusNode.unfocus();
        _phoneNumberFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: AppBarTitle(),
        ),
        body: Responsive(

          desktop:  Row(
             children: [
             Expanded(
             flex: 3,


             child: LayoutBuilder(

    builder: (context, constraints) =>   SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 20.0,
        ),
        child: AddItemForm(
       NameFocusNode: _NameFocusNode,
          applyforFocusNode: _applyforFocusNode,
          birthdayFocusNode: _birthdayFocusNode,
          ParentFocusNode:  _ParentFocusNode,
          AddressFocusNode: _AddressFocusNode,
          EmailFocusNode: _EmailFocusNode,
          cityFocusNode: _cityFocusNode,
          countryFocusNode: _countryFocusNode,
          phoneNumberFocusNode: _phoneNumberFocusNode,
        ),
      ),
    ),)

             ),

    ],

        ),

          tablet:  Row(
            children: [
              Expanded(
                  flex: 3,


                  child: LayoutBuilder(

                    builder: (context, constraints) =>   SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 20.0,
                        ),
                        child: AddItemForm(
                          NameFocusNode: _NameFocusNode,
                          applyforFocusNode: _applyforFocusNode,
                          birthdayFocusNode: _birthdayFocusNode,
                          ParentFocusNode:  _ParentFocusNode,
                          AddressFocusNode: _AddressFocusNode,
                          EmailFocusNode: _EmailFocusNode,
                          cityFocusNode: _cityFocusNode,
                          countryFocusNode: _countryFocusNode,
                          phoneNumberFocusNode: _phoneNumberFocusNode,
                        ),
                      ),
                    ),)

              ),

            ],

          ),

          mobile:  Row(
            children: [
              Expanded(
                  flex: 3,


                  child: LayoutBuilder(

                    builder: (context, constraints) =>   SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 20.0,
                        ),
                        child: AddItemFormM(
                          NameFocusNode: _NameFocusNode,
                          applyforFocusNode: _applyforFocusNode,
                          birthdayFocusNode: _birthdayFocusNode,
                          ParentFocusNode:  _ParentFocusNode,
                          AddressFocusNode: _AddressFocusNode,
                          EmailFocusNode: _EmailFocusNode,
                          cityFocusNode: _cityFocusNode,
                          countryFocusNode: _countryFocusNode,
                          phoneNumberFocusNode: _phoneNumberFocusNode,
                        ),
                      ),
                    ),)

              ),
    
            ],
          ),
      ),
      ));

  }
}
