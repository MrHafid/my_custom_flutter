import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Validation.dart';

// ------ Example to Use ---------
// final _keyForm = GlobalKey<FormState>();
// late DynamicForm dform;
// List<QuestionBase> question = [];

// ------ In SetState ---------
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     question = [
  //       new TextboxQuestion(
  //           'no_kk', null, false, 'Nomor KK', true, '${widget.data!['no_kk']}'),
  //       new SwitchQuestion(
  //           'jenis_kelamin',
  //           null,
  //           false,
  //           'Jenis Kelamin',
  //           [
  //             {'key': 0, 'value': 'Laki - Laki'},
  //             {'key': 1, 'value': 'Perempuan'},
  //           ],
  //           widget.data!['jenis_kelamin'] != 'Perempuan' ? 0 : 1),
  //       new TextboxQuestion('tempat_lahir', null, false, 'Tempat Lahir', true,
  //           '${widget.data!['tempat_lahir']}'),
  //       new DateTimePicker(
  //           'tanggal_lahir',
  //           null,
  //           false,
  //           'Tanggal Lahir',
  //           widget.data!['tanggal_lahir'] != "0000-00-00"
  //               ? '${widget.data!['tanggal_lahir']}'
  //               : null),
  //       new TextboxQuestion(
  //           'alamat', null, false, 'Alamat', true, '${widget.data!['alamat']}'),
  //       new TextboxQuestion(
  //           'rt', null, false, 'RT', true, '${widget.data!['rt']}'),
  //       new TextboxQuestion(
  //           'rw', null, false, 'RW', true, '${widget.data!['rw']}'),
  //       new TextboxQuestion(
  //           'desa', null, false, 'Desa', true, '${widget.data!['desa']}'),
  //       new TextboxQuestion('kecamatan', null, false, 'Kecamatan', true,
  //           '${widget.data!['kecamatan']}'),
  //       new TextboxQuestion('kabupaten', null, false, 'Kabupaten', true,
  //           '${widget.data!['kabupaten']}'),
  //       new TextboxQuestion('provinsi', null, false, 'Provinsi', true,
  //           '${widget.data!['provinsi']}'),
  //       new DropdownQuestion(
  //           'agama',
  //           null,
  //           false,
  //           'Agama',
  //           [
  //             {'key': 'Islam', 'value': 'Islam'},
  //             {'key': 'Kristen', 'value': 'Kristen'},
  //             {'key': 'Katholik', 'value': 'Katholik'},
  //             {'key': 'Hindu', 'value': 'Hindu'},
  //             {'key': 'Buddha', 'value': 'Buddha'},
  //             {'key': 'Konghucu', 'value': 'Konghucu'},
  //             {'key': 'Kepercayaan Lainnya', 'value': 'Kepercayaan Lainnya'},
  //           ],
  //           widget.data!['agama'] != '' ? '${widget.data!['agama']}' : null),
  //       new DropdownQuestion(
  //           'status',
  //           null,
  //           false,
  //           'Status',
  //           [
  //             {'key': 'Kawin', 'value': 'Kawin'},
  //             {'key': 'Belum Kawin', 'value': 'Belum Kawin'},
  //             {'key': 'Cerai Mati', 'value': 'Cerai Mati'},
  //             {'key': 'Cerai Hidup', 'value': 'Cerai Hidup'},
  //           ],
  //           widget.data!['status'] != '' ? '${widget.data!['status']}' : null),
  //       new DropdownQuestion(
  //           'shdk',
  //           null,
  //           false,
  //           'Status Dalam Keluarga',
  //           [
  //             {'key': 'Kepala Keluarga', 'value': 'Kepala Keluarga'},
  //             {'key': 'Istri', 'value': 'Istri'},
  //             {'key': 'Anak', 'value': 'Anak'},
  //             {'key': 'Orang Tua', 'value': 'Orang Tua'},
  //             {'key': 'Cucu', 'value': 'Cucu'},
  //             {'key': 'Mertua', 'value': 'Mertua'},
  //             {'key': 'Famili Lain', 'value': 'Famili Lain'},
  //           ],
  //           widget.data!['shdk'] != '' ? '${widget.data!['shdk']}' : null),
  //       new DropdownQuestion(
  //           'pendidikan',
  //           null,
  //           false,
  //           'Pendidikan',
  //           [
  //             {'key': 'SD/Sederajat', 'value': 'SD/Sederajat'},
  //             {'key': 'SLTP/Sederajat', 'value': 'SLTP/Sederajat'},
  //             {'key': 'SLTA/Sederajat', 'value': 'SLTA/Sederajat'},
  //             {'key': 'D3', 'value': 'D3'},
  //             {'key': 'D4', 'value': 'D4'},
  //             {'key': 'S1', 'value': 'S1'},
  //             {'key': 'S2', 'value': 'S2'},
  //             {'key': 'S3', 'value': 'S3'},
  //             {'key': 'Doktoral', 'value': 'Doktoral'},
  //             {'key': 'Tidak/Belum Sekolah', 'value': 'Tidak/Belum Sekolah'},
  //           ],
  //           widget.data!['pendidikan'] != ''
  //               ? '${widget.data!['pendidikan']}'
  //               : null),
  //       new DropdownQuestion(
  //           'pekerjaan',
  //           null,
  //           false,
  //           'Pekerjaan',
  //           [
  //             {'key': 'Pelajar/Mahasiswa', 'value': 'Pelajar/Mahasiswa'},
  //             {
  //               'key': 'Mengurus Rumah Tangga',
  //               'value': 'Mengurus Rumah Tangga'
  //             },
  //             {'key': 'Wiraswasta', 'value': 'Wiraswasta'},
  //             {'key': 'Karyawan Swasta', 'value': 'Karyawan Swasta'},
  //             {'key': 'Buruh Harian Lepas', 'value': 'Buruh Harian Lepas'},
  //             {'key': 'Petani/Pekebun', 'value': 'Petani/Pekebun'},
  //             {'key': 'Pegawai Negeri Sipil', 'value': 'Pegawai Negeri Sipil'},
  //             {'key': 'TNI', 'value': 'TNI'},
  //             {'key': 'Kepolisian RI', 'value': 'Kepolisian RI'},
  //             {'key': 'Pedagang', 'value': 'Pedagang'},
  //             {'key': 'Pegawai Honorer', 'value': 'Pegawai Honorer'},
  //             {
  //               'key': 'Aparatur Sipil Negara',
  //               'value': 'Aparatur Sipil Negara'
  //             },
  //             {'key': 'Transportasi', 'value': 'Transportasi'},
  //             {'key': 'Tidak/Belum Bekerja', 'value': 'Tidak/Belum Bekerja'},
  //           ],
  //           widget.data!['pekerjaan'] != ''
  //               ? '${widget.data!['pekerjaan']}'
  //               : null),
  //       new TextboxQuestion('nama_ibu', null, false, 'Nama Ibu (Opsional)',
  //           false, '${widget.data!['nama_ibu']}'),
  //       new TextboxQuestion('nama_ayah', null, false, 'Nama Ayah (Opsional)',
  //           false, '${widget.data!['nama_ayah']}'),
  //       new DropdownQuestion(
  //           'warga_negara',
  //           null,
  //           false,
  //           'Warga Negara',
  //           [
  //             {'key': 'Indonesia', 'value': 'Indonesia'},
  //             {'key': 'Asing', 'value': 'Asing'},
  //           ],
  //           widget.data!['warga_negara'] != ''
  //               ? '${widget.data!['warga_negara']}'
  //               : null),
  //     ];
  //   });
  // }

// ------ Example to submit --------
// _handleSubmit() async {
//   Map dd = dform.getValue(key: _keyForm);
//   setState(() {
//     loading = true;
//   });
//   dd['id'] = GetIt.instance.get<Auth>().userId;
//   dd['jenis_kelamin'] =
//       dd['jenis_kelamin'] == 0 ? 'Laki - Laki' : 'Perempuan';
//   var up = await GetIt.instance
//       .get<Services>()
//       .postItem(apis: 'user/update_profile', datas: dd);
//   print(up);
//   if (up != null && up['err_code'] == 0) {
//     setState(() {
//       loading = false;
//     });
//     GetIt.I.get<Auth>().saveProfilePref(data: dd);
//     showMyDialog(
//         title: 'Berhasil',
//         desc: 'Data Berhasil Diupdate',
//         dialogType: DType.success,
//         okBtn: () {});
//     GetIt.I.get<Auth>().getPref();
//   } else {
//     showMyDialog(
//         title: 'ERROR',
//         desc: up['err_message'],
//         dialogType: DType.error,
//         okBtn: () {});
//   }
// }

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
