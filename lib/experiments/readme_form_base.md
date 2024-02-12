## Example to use dynamic form - Form Base
#### Construct
```
final _keyForm = GlobalKey<FormState>();
late DynamicForm dform;
List<QuestionBase> question = [];
```
#### In Widget
```
 Widget Forms(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Form(
        key: _keyForm,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: dform = DynamicForm(
                questions: question,
                isEnabled: !loading,
              ),
            ),
          ],
        ),
      ),
    );
  }
```
#### InitState Value
```
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      question = [
        new TextboxQuestion(
            'no_kk', null, false, 'Nomor KK', true, '${widget.data!['no_kk']}'),
        new SwitchQuestion(
            'jenis_kelamin',
            null,
            false,
            'Jenis Kelamin',
            [
              {'key': 0, 'value': 'Laki - Laki'},
              {'key': 1, 'value': 'Perempuan'},
            ],
            widget.data!['jenis_kelamin'] != 'Perempuan' ? 0 : 1),
        new TextboxQuestion('tempat_lahir', null, false, 'Tempat Lahir', true,
            '${widget.data!['tempat_lahir']}'),
        new DateTimePicker(
            'tanggal_lahir',
            null,
            false,
            'Tanggal Lahir',
            widget.data!['tanggal_lahir'] != "0000-00-00"
                ? '${widget.data!['tanggal_lahir']}'
                : null),
        new TextboxQuestion(
            'alamat', null, false, 'Alamat', true, '${widget.data!['alamat']}'),
        new TextboxQuestion(
            'rt', null, false, 'RT', true, '${widget.data!['rt']}'),
        new TextboxQuestion(
            'rw', null, false, 'RW', true, '${widget.data!['rw']}'),
        new TextboxQuestion(
            'desa', null, false, 'Desa', true, '${widget.data!['desa']}'),
        new TextboxQuestion('kecamatan', null, false, 'Kecamatan', true,
            '${widget.data!['kecamatan']}'),
        new TextboxQuestion('kabupaten', null, false, 'Kabupaten', true,
            '${widget.data!['kabupaten']}'),
        new TextboxQuestion('provinsi', null, false, 'Provinsi', true,
            '${widget.data!['provinsi']}'),
        new DropdownQuestion(
            'agama',
            null,
            false,
            'Agama',
            [
              {'key': 'Islam', 'value': 'Islam'},
              {'key': 'Kristen', 'value': 'Kristen'},
              {'key': 'Katholik', 'value': 'Katholik'},
              {'key': 'Hindu', 'value': 'Hindu'},
              {'key': 'Buddha', 'value': 'Buddha'},
              {'key': 'Konghucu', 'value': 'Konghucu'},
              {'key': 'Kepercayaan Lainnya', 'value': 'Kepercayaan Lainnya'},
            ],
            widget.data!['agama'] != '' ? '${widget.data!['agama']}' : null),
        new DropdownQuestion(
            'status',
            null,
            false,
            'Status',
            [
              {'key': 'Kawin', 'value': 'Kawin'},
              {'key': 'Belum Kawin', 'value': 'Belum Kawin'},
              {'key': 'Cerai Mati', 'value': 'Cerai Mati'},
              {'key': 'Cerai Hidup', 'value': 'Cerai Hidup'},
            ],
            widget.data!['status'] != '' ? '${widget.data!['status']}' : null),
        new DropdownQuestion(
            'shdk',
            null,
            false,
            'Status Dalam Keluarga',
            [
              {'key': 'Kepala Keluarga', 'value': 'Kepala Keluarga'},
              {'key': 'Istri', 'value': 'Istri'},
              {'key': 'Anak', 'value': 'Anak'},
              {'key': 'Orang Tua', 'value': 'Orang Tua'},
              {'key': 'Cucu', 'value': 'Cucu'},
              {'key': 'Mertua', 'value': 'Mertua'},
              {'key': 'Famili Lain', 'value': 'Famili Lain'},
            ],
            widget.data!['shdk'] != '' ? '${widget.data!['shdk']}' : null),
        new DropdownQuestion(
            'pendidikan',
            null,
            false,
            'Pendidikan',
            [
              {'key': 'SD/Sederajat', 'value': 'SD/Sederajat'},
              {'key': 'SLTP/Sederajat', 'value': 'SLTP/Sederajat'},
              {'key': 'SLTA/Sederajat', 'value': 'SLTA/Sederajat'},
              {'key': 'D3', 'value': 'D3'},
              {'key': 'D4', 'value': 'D4'},
              {'key': 'S1', 'value': 'S1'},
              {'key': 'S2', 'value': 'S2'},
              {'key': 'S3', 'value': 'S3'},
              {'key': 'Doktoral', 'value': 'Doktoral'},
              {'key': 'Tidak/Belum Sekolah', 'value': 'Tidak/Belum Sekolah'},
            ],
            widget.data!['pendidikan'] != ''
                ? '${widget.data!['pendidikan']}'
                : null),
        new DropdownQuestion(
            'pekerjaan',
            null,
            false,
            'Pekerjaan',
            [
              {'key': 'Pelajar/Mahasiswa', 'value': 'Pelajar/Mahasiswa'},
              {
                'key': 'Mengurus Rumah Tangga',
                'value': 'Mengurus Rumah Tangga'
              },
              {'key': 'Wiraswasta', 'value': 'Wiraswasta'},
              {'key': 'Karyawan Swasta', 'value': 'Karyawan Swasta'},
              {'key': 'Buruh Harian Lepas', 'value': 'Buruh Harian Lepas'},
              {'key': 'Petani/Pekebun', 'value': 'Petani/Pekebun'},
              {'key': 'Pegawai Negeri Sipil', 'value': 'Pegawai Negeri Sipil'},
              {'key': 'TNI', 'value': 'TNI'},
              {'key': 'Kepolisian RI', 'value': 'Kepolisian RI'},
              {'key': 'Pedagang', 'value': 'Pedagang'},
              {'key': 'Pegawai Honorer', 'value': 'Pegawai Honorer'},
              {
                'key': 'Aparatur Sipil Negara',
                'value': 'Aparatur Sipil Negara'
              },
              {'key': 'Transportasi', 'value': 'Transportasi'},
              {'key': 'Tidak/Belum Bekerja', 'value': 'Tidak/Belum Bekerja'},
            ],
            widget.data!['pekerjaan'] != ''
                ? '${widget.data!['pekerjaan']}'
                : null),
        new TextboxQuestion('nama_ibu', null, false, 'Nama Ibu (Opsional)',
            false, '${widget.data!['nama_ibu']}'),
        new TextboxQuestion('nama_ayah', null, false, 'Nama Ayah (Opsional)',
            false, '${widget.data!['nama_ayah']}'),
        new DropdownQuestion(
            'warga_negara',
            null,
            false,
            'Warga Negara',
            [
              {'key': 'Indonesia', 'value': 'Indonesia'},
              {'key': 'Asing', 'value': 'Asing'},
            ],
            widget.data!['warga_negara'] != ''
                ? '${widget.data!['warga_negara']}'
                : null),
      ];
    });
  }
```
#### Submit adn Get Data from Dynamic Form
```
_handleSubmit() async {
  Map dd = dform.getValue(key: _keyForm);
  setState(() {
    loading = true;
  });
  dd['id'] = GetIt.instance.get<Auth>().userId;
  dd['jenis_kelamin'] =
      dd['jenis_kelamin'] == 0 ? 'Laki - Laki' : 'Perempuan';
  var up = await GetIt.instance
      .get<Services>()
      .postItem(apis: 'user/update_profile', datas: dd);
  print(up);
  if (up != null && up['err_code'] == 0) {
    setState(() {
      loading = false;
    });
    GetIt.I.get<Auth>().saveProfilePref(data: dd);
    showMyDialog(
        title: 'Berhasil',
        desc: 'Data Berhasil Diupdate',
        dialogType: DType.success,
        okBtn: () {});
    GetIt.I.get<Auth>().getPref();
  } else {
    showMyDialog(
        title: 'ERROR',
        desc: up['err_message'],
        dialogType: DType.error,
        okBtn: () {});
  }
}

```
