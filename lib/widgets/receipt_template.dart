import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: OrangeClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250.0,
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
          ),
          ClipPath(
            clipper: BlackClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width - 230.0,
              height: MediaQuery.of(context).size.height - 250.0,
              decoration: BoxDecoration(
                color: Colors.red.shade500,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  Center(
                    // top: 300.0,
                    // left: 30.0,
                    // right: 30.0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 18),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, -5.0),
                                blurRadius: 8,
                                spreadRadius: 2)
                          ]),
                      child: ClipPath(
                        clipper: ZigZagClipper(),
                        child: ClipPath(
                          clipper: MyClipper(),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14),
                                  bottomLeft: Radius.circular(14),
                                  bottomRight: Radius.circular(14)),
                            ),
                            // width: 200.0,
                            // height: 450.0,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Container(
                                  //   height: 55,
                                  //   alignment: Alignment.center,
                                  //   margin: EdgeInsets.symmetric(vertical: 25),
                                  //   child:
                                  //       widget.inv!['id_payment_method'] != null
                                  //           ? PNetworkImage(
                                  //               '${widget.inv!['payment_image']}',
                                  //               fit: BoxFit.fill,
                                  //             )
                                  //           : Image.asset(
                                  //               'assets/des/dedi_red2.png',
                                  //               fit: BoxFit.fill,
                                  //             ),
                                  // ),

                                  Container(
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                            child: AutoSizeText(
                                          'Tanggal',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        )),
                                        Expanded(
                                            child: AutoSizeText(
                                          'id',
                                          textAlign: TextAlign.end,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        )),
                                      ],
                                    ),
                                  ),

                                  // Top Divider
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 18.0, top: 12),
                                    child: Container(
                                      // width: 300.0,
                                      height: 1.0,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  // Top Status
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 120.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          border: Border.all(
                                              width: 1.0, color: Colors.red),
                                        ),
                                        child: const Center(
                                          child: AutoSizeText(
                                            'Status',
                                            maxLines: 1,
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 3.5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const AutoSizeText(
                                          'Kategori',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Desc
                                  const Padding(
                                      padding: EdgeInsets.only(top: 20.0),
                                      child: Text.rich(
                                        TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(text: 'Kode SKU'),
                                            TextSpan(
                                              text: 'Customer No',
                                              // .replaceRange(
                                              //     4,
                                              //     widget.inv['customer_no']
                                              //             .length -
                                              //         2,
                                              //     "*" *
                                              //         (widget.inv['customer_no']
                                              //                 .length -
                                              //             7)),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ticketDetailsWidget(
                                            'Nama', 'Nama', 'Dibuat', 'Dibuat'),
                                        ticketDetailsWidget('Kode Produk',
                                            'Kode Produk', 'Harga', '-'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    margin: const EdgeInsets.only(
                                      top: 12,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          child: const Text(
                                            'Total Bayar',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                        Expanded(
                                            child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          child: AutoSizeText(
                                            'Rp${NumberFormat('#,##0', 'ID').format(double.parse('000'))}',
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Container(
                                      width: 300.0,
                                      height: 1.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 10.0,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'PT. DESA DIGITAL GLOBAL',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 33,
                    child: Column(
                      children: [1, 2, 3, 4, 5, 6, 7, 8]
                          .asMap()
                          .map((i, e) => MapEntry(
                              i,
                              RotatedBox(
                                quarterTurns: -1,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: i == 4 ? 50 : 10,
                                  ),
                                  child: ColorFiltered(
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.saturation,
                                    ),
                                    child: Image.asset(
                                      'assets/des/dedi_red.png',
                                      height: 15,
                                    ),
                                  ),
                                ),
                              )))
                          .values
                          .toList(),
                    ),
                  ),
                ],
              ),
              // Button Share and download
              Container(
                // margin: EdgeInsets.only(top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(CupertinoPageRoute(
                        //     builder: (context) => ScreenshotInvoice(
                        //           inv: widget.inv,
                        //           isShare: true,
                        //         )));
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.red),
                            child: const Center(
                              child: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                          const Text(
                            'Share',
                            style: TextStyle(color: Colors.red, fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(CupertinoPageRoute(
                        //     builder: (context) => ScreenshotInvoice(
                        //           inv: widget.inv,
                        //         )));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.red),
                            child: const Center(
                              child: Icon(
                                Icons.save_alt,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                          const Text(
                            'Save',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 12.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.red,
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.red, width: 1.5),
                      color: Colors.white),
                  child: const Center(
                    child: Text(
                      'Done',
                      style: TextStyle(color: Colors.red, fontSize: 15.0),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    firstTitle,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: AutoSizeText(
                      firstDesc,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    secondTitle,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: AutoSizeText(
                      secondDesc,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(23.0, size.height - 20.0);
    var firstEndPoint = Offset(38.0, size.height - 5.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(58.0, size.height - 20.0);
    var secondEndPoint = Offset(75.0, size.height - 5.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(93.0, size.height - 20.0);
    var thirdEndPoint = Offset(110.0, size.height - 5.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    var fourthControlPoint = Offset(128.0, size.height - 20.0);
    var fourthEndPoint = Offset(150.0, size.height - 5.0);
    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
        fourthEndPoint.dx, fourthEndPoint.dy);

    var fifthControlPoint = Offset(168.0, size.height - 20.0);
    var fifthEndPoint = Offset(185.0, size.height - 5.0);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fifthEndPoint.dx, fifthEndPoint.dy);

    var sixthControlPoint = Offset(205.0, size.height - 20.0);
    var sixthEndPoint = Offset(220.0, size.height - 5.0);
    path.quadraticBezierTo(sixthControlPoint.dx, sixthControlPoint.dy,
        sixthEndPoint.dx, sixthEndPoint.dy);

    var sevenControlPoint = Offset(240.0, size.height - 20.0);
    var sevenEndPoint = Offset(255.0, size.height - 5.0);
    path.quadraticBezierTo(sevenControlPoint.dx, sevenControlPoint.dy,
        sevenEndPoint.dx, sevenEndPoint.dy);

    var eightControlPoint = Offset(275.0, size.height - 20.0);
    var eightEndPoint = Offset(290.0, size.height - 5.0);
    path.quadraticBezierTo(eightControlPoint.dx, eightControlPoint.dy,
        eightEndPoint.dx, eightEndPoint.dy);

    var ninthControlPoint = Offset(310.0, size.height - 20.0);
    var ninthEndPoint = Offset(330.0, size.height - 5.0);
    path.quadraticBezierTo(ninthControlPoint.dx, ninthControlPoint.dy,
        ninthEndPoint.dx, ninthEndPoint.dy);

    path.lineTo(size.width, size.height - 10.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BlackClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width / 2, size.height - 50.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class OrangeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 250.0, size.height - 50.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 2 + 50.0), radius: 20.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2 + 50.0), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
