  late AnimationController controllerAnimation;
  late Animation<Offset> offsetAnimation;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    startAnim();
    setState(() {
      tempDmt = dmt;
    });

    controllerAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    offsetAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .animate(controllerAnimation);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerScan.dispose();
    controllerAnimation.dispose();
    super.dispose();
  }

controllerAnimation.reverse().whenComplete(() {
  setState(() {
    camStarted = false;
    controllerScan.stop();
    // controllerScan.dispose();
  });
});

camStarted
? SlideTransition(
    position: offsetAnimation,
    child: showQrScan(),
  )
: Container()


  // Build show qrscan
  Widget showQrScan() {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(const Offset(
          0.0, -200)), //MediaQuery.of(context).size.center(Offset.zero)
      width: 200,
      height: 200,
    );

    return Container(
      // height: Get.height / 1.2,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 245),
      child: Stack(
        // fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            child: MobileScanner(
              // fit: BoxFit.contain,
              onDetect: onBarcodeDetect,
              overlay: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Opacity(
                      opacity: 0.7,
                      child: Text(
                        overlayText,
                        style: const TextStyle(
                          backgroundColor: Colors.black26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              ),
              controller: controllerScan,
              scanWindow: scanWindow,
              errorBuilder: (context, error, child) {
                return Container();
              },
            ),
          ),
          CustomPaint(
            painter: ScannerOverlay(scanWindow),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 14, right: 14, bottom: 21),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => controllerScan.toggleTorch(),
                    icon: ValueListenableBuilder<TorchState>(
                      valueListenable: controllerScan.torchState,
                      builder: (_, value, __) {
                        print("valuessss${value.name}");

                        return Icon(
                          Icons.flashlight_on_rounded,
                          color: value.name == 'off'
                              ? Colors.black
                              : Colors.yellow,
                        );
                      },
                    ),
                  ),
                  const Expanded(
                      child: Text(
                    'Scan Qr Resi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )),
                  IconButton(
                    onPressed: () => controllerScan.switchCamera(),
                    icon: const Icon(
                      CupertinoIcons.camera_rotate,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(right: 12, top: 12),
              child: IconButton(
                onPressed: () {
                  controllerAnimation.reverse().whenComplete(() {
                    setState(() {
                      controllerScan.dispose();
                      camStarted = false;
                      // controllerScan.stop();
                    });
                  });
                },
                icon: const Icon(
                  CupertinoIcons.clear_circled,
                  color: Colors.red,
                  size: 32,
                ),
              ),
            ),
          )
        ],
      ),
    );
    // showModalBottomSheet<void>(
    //   context: context,
    //   backgroundColor: Colors.white,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       topRight: Radius.circular(40),
    //       topLeft: Radius.circular(40),
    //     ),
    //   ),
    //   builder: (BuildContext context) {
    //     return ;
    //   },
    // ).whenComplete(() {
    //   controllerScan.stop();
    //   controllerScan.dispose();
    // });
  }
