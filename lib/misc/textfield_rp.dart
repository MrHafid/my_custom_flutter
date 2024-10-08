  static const _locale = 'id';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));

  Ex value 'harga_barang': harga.text.replaceAll('.', ''),

TextField(
    controller: harga,
    onChanged: (string) {
      var strings =
          '${_formatNumber(string.replaceAll(',', ''))}';
      setState(() {
        harga.value = TextEditingValue(
          text: strings,
          selection: TextSelection.collapsed(
              offset: strings.length),
        );
      });
    },
    style: TextStyle(color: Colors.black54),
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly,
    ],
    decoration: InputDecoration(
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      hintText: 'Harga Produk',
      hintStyle:
          TextStyle(color: Colors.black54),
    ),
