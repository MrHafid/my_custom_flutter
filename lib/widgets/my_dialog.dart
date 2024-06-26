
enum DType {
  @Deprecated("Use effective dart version 'info' ")

  ///Dialog with information type header
  INFO,

  ///Dialog with information type header
  info,

  ///Dialog with information type header rotated 180 degree
  @Deprecated("Use effective dart version 'infoReverse' ")
  INFO_REVERSED,

  ///Dialog with information type header rotated 180 degree
  infoReverse,

  ///Dialog with warning amber type header
  @Deprecated("Use effective dart version 'warning' ")
  WARNING,

  ///Dialog with warning amber type header
  warning,

  ///Dialog with error red type header
  @Deprecated("Use effective dart version 'error' ")
  ERROR,

  ///Dialog with error red type header
  error,

  ///Dialog with success green type header
  @Deprecated("Use effective dart version 'success' ")
  SUCCES,

  ///Dialog with success green type header
  success,

  @Deprecated("Use effective dart version 'noHeader' ")

  ///Dialog without a header
  NO_HEADER,

  ///Dialog without a header
  noHeader,

  ///Dialog with question header
  question
}

enum AType {
  @Deprecated("Use effective dart version 'scale' ")
  SCALE,
  scale,
  @Deprecated("Use effective dart version 'leftSlide' ")
  LEFTSLIDE,
  leftSlide,
  @Deprecated("Use effective dart version 'rightSlide' ")
  RIGHSLIDE,
  rightSlide,
  @Deprecated("Use effective dart version 'bottomSlide' ")
  BOTTOMSLIDE,
  bottomSlide,
  @Deprecated("Use effective dart version 'topSlide' ")
  TOPSLIDE,
  topSlide,
}

showMyDialog(
    {DType dialogType = DType.info,
    AType animType = AType.scale,
    String title = '',
    String desc = '',
    double? width,
    Widget? body,
    bool dismisOut = true,
    bool closeBtn = false,
    EdgeInsets padding = const EdgeInsets.only(left: 8, right: 8),
    Alignment alignment = Alignment.center,
    String textOke = 'Oke',
    String textCancel = 'Cancel',
    Color? btnOkColor,
    Color? btnCancelColor,
    hideDuration,
    cancelBtn,
    okBtn,
    Function(String)? dismissCallback}) {
  return AwesomeDialog(
    context: Get.context!,
    dialogType: dialogType == DType.info
        ? DialogType.info
        : dialogType == DType.warning
            ? DialogType.warning
            : dialogType == DType.question
                ? DialogType.question
                : dialogType == DType.success
                    ? DialogType.success
                    : dialogType == DType.error
                        ? DialogType.error
                        : dialogType == DType.infoReverse
                            ? DialogType.infoReverse
                            : DialogType.noHeader,
    animType: animType == AType.rightSlide
        ? AnimType.rightSlide
        : animType == AType.leftSlide
            ? AnimType.leftSlide
            : animType == AType.topSlide
                ? AnimType.topSlide
                : animType == AType.bottomSlide
                    ? AnimType.bottomSlide
                    : AnimType.scale,
    onDismissCallback: dismissCallback != null
        ? (type) {
            if (type == DismissType.btnOk) {
              dismissCallback('ok');
            } else if (type == DismissType.autoHide) {
              dismissCallback('ok');
            } else {
              dismissCallback('cancel');
            }
          }
        : null,
    title: title,
    desc: desc,
    dismissOnTouchOutside: dismisOut,
    dismissOnBackKeyPress: false,
    body: body,
    width: width,
    padding: padding,
    btnCancelOnPress: cancelBtn,
    showCloseIcon: closeBtn,
    btnOkOnPress: okBtn,
    btnOkText: textOke,
    btnCancelText: textCancel,
    btnOkColor: btnOkColor,
    btnCancelColor: btnCancelColor,
    autoHide: hideDuration,
    alignment: alignment,
  ).show();
}


// Dim Dialog
DimLoadingDialog progressDimDialog =
    DimLoadingDialog(GlobalVariable.navState.currentState!.context,
        blur: 2,
        backgroundColor: const Color(0x33000000),
        loadingWidget: Container(
          padding: const EdgeInsets.all(10.0),
          height: 100.0,
          width: 100.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: const ColorLoader2(),
        ),
        dismissable: true,
        animationDuration: const Duration(milliseconds: 500));
