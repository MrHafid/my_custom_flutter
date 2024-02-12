import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Validation.dart';

class FormBaseWidget<T> extends StatelessWidget {
  final Widget widget;
  FormBaseWidget(this.widget);
  late ValueNotifier<T> _counter;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: _counter,
      builder: (context, value, child) {
        return widget;
      },
    );
  }
}

class QuestionBase {
  final String key;
  final String type;
  final Icon? icon;
  bool readOnly;
  String label;
  dynamic value;
  Widget? widget;

  QuestionBase(
      this.key, this.type, this.icon, this.readOnly, this.value, this.label);
}

class SwitchQuestion<T> extends QuestionBase {
  final List<Map> options;
  SwitchQuestion(
      String key, Icon? icon, bool readOnly, String label, this.options,
      [dynamic value])
      : super(key, 'switch', icon ?? null, readOnly, value, label);
}

class DateTimePicker<T> extends QuestionBase {
  TextEditingController controller = new TextEditingController();
  DateTimePicker(String key, Icon? icon, bool readOnly, String label,
      [dynamic value])
      : super(key, 'datePicker', icon ?? null, readOnly, value, label);
}

class DropdownQuestion<T> extends QuestionBase {
  final List<Map> options;
  DropdownQuestion(
      String key, Icon? icon, bool readOnly, String label, this.options,
      [dynamic value])
      : super(key, 'dropdown', icon ?? null, readOnly, value, label);
}

class TextboxQuestion extends QuestionBase {
  TextEditingController controller = new TextEditingController();
  bool required = false;
  TextboxQuestion(
      String key, Icon? icon, bool readOnly, String label, this.required,
      [dynamic value])
      : super(key, 'textbox', icon ?? null, readOnly, value, label);
}

class NumberboxQuestion extends QuestionBase {
  TextEditingController controller = new TextEditingController();
  bool required = false;
  NumberboxQuestion(
      String key, Icon icon, bool readOnly, String label, this.required,
      [dynamic value])
      : super(key, 'numbox', icon ?? null, readOnly, value, label);
}

class TextAreaQuestion extends QuestionBase {
  TextEditingController controller = new TextEditingController();
  bool required = false;
  TextAreaQuestion(
      String key, Icon icon, bool readOnly, String label, this.required,
      [dynamic value])
      : super(key, 'textarea', icon ?? null, readOnly, value, label);
}

class DynamicForm extends StatefulWidget {
  final List<QuestionBase>? questions;
  final bool isEnabled;

  DynamicForm({this.questions, this.isEnabled = true});

  Map getValue({required key}) {
    if (key.currentState.validate()) {
      var body = {};
      debugPrint(questions!.length.toString());
      this.questions!.forEach((f) {
        body.addAll({f.key: f.value});
      });
      return body;
    }
    return {};
  }

  @override
  DynamicFormState createState() => new DynamicFormState();
}

class DynamicFormState extends State<DynamicForm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: widget.questions!.map((q) {
        return getQuestionWidget(q);
      }).toList(),
    );
  }

  Widget getQuestionWidget(QuestionBase q) {
    switch (q.type) {
      case 'switch':
        var sw = (q as SwitchQuestion);
        return Container(
          margin: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 5, bottom: 5),
                child: Text(
                  '${sw.label}',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: CupertinoSlidingSegmentedControl(
                    groupValue: sw.value,
                    // backgroundColor: Colors.white,
                    thumbColor: Colors.blue,
                    children: <int, Widget>{
                      0: Container(
                          child: Text(
                            '${sw.options[0]['value']}',
                            style: TextStyle(
                                color: sw.value == 0
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 16)),
                      1: Container(
                          child: Text(
                            '${sw.options[1]['value']}',
                            style: TextStyle(
                                color: sw.value == 1
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 16)),
                    },
                    onValueChanged: (dynamic value) {
                      setState(() {
                        sw.value = value;
                        // print(value);
                      });
                    }),
              )
            ],
          ),
        );

      case 'datePicker':
        var dateP = (q as DateTimePicker);
        DateTime? initDate = dateP.value != null
            ? DateTime.tryParse(
                DateFormat('yyyy-MM-dd').format(DateTime.parse(dateP.value)))
            : DateTime.now();

        void _showDatePicker(ctx) {
          // showCupertinoModalPopup is a built-in function of the cupertino library
          showCupertinoModalPopup(
              context: ctx,
              // barrierDismissible: false,
              builder: (_) => Container(
                    height: 500,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      children: [
                        Container(
                          height: 400,
                          child: CupertinoDatePicker(
                              initialDateTime: initDate,
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (val) {
                                setState(() {
                                  initDate = val;
                                  dateP.value = DateFormat('yyyy-MM-dd').format(
                                      DateTime.parse(initDate.toString()));
                                  dateP.controller.text =
                                      DateFormat('dd MMMM yyyy').format(
                                          DateTime.parse(initDate.toString()));
                                });
                              }),
                        ),

                        // Close the modal
                        CupertinoButton(
                          child: Text('OK'),
                          onPressed: () {
                            setState(() {
                              dateP.value = DateFormat('yyyy-MM-dd')
                                  .format(DateTime.parse(initDate.toString()));
                              dateP.controller.text = DateFormat('dd MMMM yyyy')
                                  .format(DateTime.parse(initDate.toString()));
                            });
                            Navigator.of(ctx).pop();
                          },
                        )
                      ],
                    ),
                  ));
        }
        return ListTile(
            leading: q.icon,
            title: TextFormField(
              controller: dateP.controller
                ..text = dateP.value != null
                    ? DateFormat('dd MMMM yyyy')
                        .format(DateTime.parse(dateP.value))
                    : '',
              enabled: widget.isEnabled,
              //          maxLines: d['line'],
              decoration: new InputDecoration(
                  hintText: dateP.label, labelText: dateP.label),
              readOnly: true,
              onTap: () {
                _showDatePicker(context);
              },
              onChanged: (_value) {
                dateP.value = _value;
              },
              validator: (_value) => checkFieldValidation(
                  val: _value,
                  fieldName: q.label,
                  fieldType: VALIDATION_TYPE.TEXT),
            ));

      case 'dropdown':
        var qdd = (q as DropdownQuestion);
//        debugPrint(qdd.options.toString());
        return ListTile(
            leading: q.icon,
            title: DropdownButton(
              iconEnabledColor: Colors.grey,
              isExpanded: true,
              value: qdd.value,
              onChanged: (dynamic value) {
                setState(() {
                  qdd.value = value;
                });
              },
              items: qdd.options.map((d) {
                return DropdownMenuItem(
                  child: Text(d['value'].toString()),
                  value: d['key'],
                );
              }).toList(),
              hint: Text(q.label),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ));

      case 'textarea':
        var qtexta = (q as TextAreaQuestion);
        print(qtexta.readOnly);
        return ListTile(
            leading: q.icon,
            title: TextFormField(
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              enabled: widget.isEnabled,
              readOnly: q.readOnly,
              controller: qtexta.controller..text = qtexta.value,
              //          maxLines: d['line'],
              decoration: new InputDecoration(
                  hintText: qtexta.label, labelText: qtexta.label),
              onChanged: (_value) {
                qtexta.value = _value;
              },
              validator: qtexta.required == false
                  ? null
                  : (_value) => checkFieldValidation(
                      val: _value,
                      fieldName: q.label,
                      fieldType: VALIDATION_TYPE.TEXT),
            ));
      case 'numbox':
        var qnum = (q as NumberboxQuestion);
        return ListTile(
            leading: q.icon,
            title: TextFormField(
              controller: qnum.controller..text = qnum.value,
              keyboardType: TextInputType.number,
              enabled: widget.isEnabled,
              readOnly: q.readOnly,
              //          maxLines: d['line'],
              decoration: new InputDecoration(
                  hintText: qnum.label, labelText: qnum.label),
              onChanged: (_value) {
                qnum.value = _value;
              },
              validator: qnum.required == false
                  ? null
                  : (_value) => checkFieldValidation(
                      val: _value,
                      fieldName: q.label,
                      fieldType: VALIDATION_TYPE.TEXT),
            ));
      default:
        var qtext = (q as TextboxQuestion);
        return ListTile(
            leading: q.icon,
            title: TextFormField(
              controller: qtext.controller..text = qtext.value,
              enabled: widget.isEnabled,
              readOnly: q.readOnly,
              //          maxLines: d['line'],
              decoration: new InputDecoration(
                  hintText: qtext.label, labelText: qtext.label),
              onChanged: (_value) {
                qtext.value = _value;
              },
              validator: qtext.required == false
                  ? null
                  : (_value) => checkFieldValidation(
                      val: _value,
                      fieldName: q.label,
                      fieldType: VALIDATION_TYPE.TEXT),
            ));
    }
  }
}
