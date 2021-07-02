import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:project_a/utils/Database.dart';
import 'package:project_a/utils/Validator.dart';

import 'custom_form_field.dart';

class AddItemFormM extends StatefulWidget {
  final FocusNode NameFocusNode;
  final FocusNode applyforFocusNode;

  final FocusNode birthdayFocusNode;
  final FocusNode ParentFocusNode;
  final FocusNode AddressFocusNode;
  final FocusNode EmailFocusNode;
  final FocusNode cityFocusNode;
  final FocusNode countryFocusNode;
  final FocusNode phoneNumberFocusNode;

  const AddItemFormM({
    required this.NameFocusNode,
    required this.applyforFocusNode,
    required this.birthdayFocusNode,
    required this.ParentFocusNode,
    required this.AddressFocusNode,
    required this.EmailFocusNode,
    required this.cityFocusNode,
    required this.countryFocusNode,
    required this.phoneNumberFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemFormM> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _applyforController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _ParentController = TextEditingController();
  final TextEditingController _AddressController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.jpg"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Colors.orange.withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "For students applying to",
                              style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: " Al youssef private School,",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(
                            height: 100,
                            width: 100,

                            child: Image.asset("assets/Alyou.jpg",alignment: Alignment.centerRight,)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Please fill in your details",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 1190,
              padding: EdgeInsets.all(30),
              color: Color.fromRGBO(232, 246, 239, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.0),

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Legal Name: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        letterSpacing: 1,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10  ,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: CustomFormField(
                        isLabelEnabled: false,
                        controller: _NameController,
                        focusNode: widget.NameFocusNode,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        validator: (value) => Validator.validateField(
                          value: value,
                        ),
                        label: 'Name ',

                        hint: 'Enter your Name',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: CustomFormField(
                        isLabelEnabled: false,
                        controller: _ParentController,
                        focusNode: widget.ParentFocusNode,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        validator: (value) => Validator.validateField(
                          value: value,
                        ),
                        label: 'Parent',
                        hint: 'Enter Parent/Guradian Name ',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Phone Number: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                        width: double.maxFinite,
                        child: IntlPhoneField(
                          controller: _phoneNumberController,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF3b5999),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                          initialCountryCode: 'EG',
                          countryCodeTextColor: Colors.black,
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        )),
                  ),

                  SizedBox(height: 24.0),
//date time
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Date of Birth *: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  /// datetime
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: DateTimePicker(
                        dateMask: 'd MMM, yyyy',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        focusNode: widget.birthdayFocusNode,
                        controller: _birthdayController,
                        dateLabelText: 'Date',
                        autovalidate: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF3b5999),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            ),
                          ),
                        ),
                        icon: Icon(
                          Icons.event,
                          color: Colors.black,
                        ),
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  ///Eamil
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Email : ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  ///Eamil
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: double.maxFinite,
                      child:
                      TextFormField(
                        validator: (val) =>  !val!.contains("@")
                            ? "enter a valid eamil"
                            : null,

                        controller: _EmailController,
                        decoration: InputDecoration(hintText: 'Enter your Eamil',  hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),

                          errorStyle: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Color(0xFF3b5999),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            ),
                        ),),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Address *: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: CustomFormField(
                        isLabelEnabled: false,
                        controller: _AddressController,
                        focusNode: widget.AddressFocusNode,
                        keyboardType: TextInputType.streetAddress,
                        inputAction: TextInputAction.next,
                        validator: (value) => Validator.validateField(
                          value: value,
                        ),
                        label: 'Address',
                        hint: 'Enter your Address',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'city *: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ), //cit
                  SizedBox(
                    height: 15,
                  ), // y
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: CustomFormField(
                        isLabelEnabled: false,
                        controller: _cityController,
                        focusNode: widget.cityFocusNode,
                        keyboardType: TextInputType.phone,
                        inputAction: TextInputAction.done,
                        validator: (value) => Validator.validateField(
                          value: value,
                        ),
                        label: 'city',
                        hint: 'Enter your city',
                      ),
                    ),
                  ),

                  SizedBox(height: 24.0),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Country *: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: CustomFormField(
                        isLabelEnabled: false,
                        controller: _countryController,
                        focusNode: widget.countryFocusNode,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        validator: (value) => Validator.validateField(
                          value: value,
                        ),
                        label: 'Country',
                        hint: 'Enter your Country',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Class*: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: CustomFormField(
                        isLabelEnabled: false,
                        controller: _applyforController,
                        focusNode: widget.applyforFocusNode,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        validator: (value) => Validator.validateField(
                          value: value,
                        ),
                        label: 'Class',
                        hint: 'Enter Class you want to apply for',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _isProcessing
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blueAccent,
                      ),
                    ),
                  )
                : Container(
                    width:double.maxFinite,
                    height: 100,
                    padding: EdgeInsets.all(30),
                    color: Colors.orange,

              child: GestureDetector(
                onTap: () async {
                  widget.NameFocusNode.unfocus();
                  widget.applyforFocusNode.unfocus();
                  widget.birthdayFocusNode.unfocus();
                  widget.ParentFocusNode.unfocus();
                  widget.AddressFocusNode.unfocus();
                  widget.EmailFocusNode.unfocus();
                  widget.cityFocusNode.unfocus();
                  widget.countryFocusNode.unfocus();

                  widget.phoneNumberFocusNode.unfocus();

                  if (_addItemFormKey.currentState!.validate()) {
                    setState(() {
                      _isProcessing = true;
                    });

                    await Database.addItem(
                      Name: _NameController.text,
                      applyfor: _applyforController.text,
                      birthday:
                      _birthdayController.text.toString(),
                      Parent: _ParentController.text,
                      Address: _AddressController.text,
                      Email: _EmailController.text,
                      city: _cityController.text,
                      country: _countryController.text,
                      phoneNumber:
                      _phoneNumberController.text.toString(),
                    );

                    setState(() {
                      _isProcessing = false;
                    });

                    Navigator.of(context).pop();
                  }
                },

                child: Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,

                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),



                  )
          ],
        ),
      ),
    );
  }
}
