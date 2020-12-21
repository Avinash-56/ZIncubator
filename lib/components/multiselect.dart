// import 'package:multiselect_formfield/multiselect_dialog.dart';
// import 'package:flutter/material.dart';

// class MultiSelct extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       MultiSelectFormField(
//                   autovalidate: false,
//                   chipBackGroundColor: Colors.red,
//                   chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//                   dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
//                   checkBoxActiveColor: Colors.red,
//                   checkBoxCheckColor: Colors.green,
//                   dialogShapeBorder: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(12.0))),
//                   title: Text(
//                     "Title Of Form",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   dataSource: [
//                     {
//                       "display": "Running",
//                       "value": "Running",
//                     },
//                     {
//                       "display": "Climbing",
//                       "value": "Climbing",
//                     },
//                     {
//                       "display": "Walking",
//                       "value": "Walking",
//                     },
//                   ],
//                   textField: 'display',
//                   valueField: 'value',
//                   okButtonLabel: 'OK',
//                   cancelButtonLabel: 'CANCEL',
//                   hintWidget: Text('Please choose one or more'),
//                   initialValue: _myActivities,
//                   onSaved: (value) {
//                     if (value == null) return;
//                     setState(() {
//                       _myActivities = value;
//                     });
//                   },
//                 ),
//     );
//   }
// }
