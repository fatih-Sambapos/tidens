import 'package:flutter/material.dart';

class AuthElevatedButton extends StatelessWidget {
  final imgUrl;

  final bool isLoading;
  final btnTxt;
  final bgColor;
  final VoidCallback onPressed;

  const AuthElevatedButton({
    Key key,
    this.imgUrl,
    this.btnTxt,
    this.bgColor,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(7),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              backgroundColor: MaterialStateProperty.all<Color>(bgColor)),
          onPressed: () {
            this.onPressed();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading?CircularProgressIndicator():
                Text(
                  btnTxt,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                imgUrl != null ? SizedBox(width: 10) : Container(),
                imgUrl != null
                    ? ClipOval(
                        child: Material(
                          shadowColor: Colors.black,
                          color: Colors.transparent,
                          elevation: 20,
                          child: Image(
                              fit: BoxFit.fitHeight,
                              width: 25,
                              height: 25,
                              image: AssetImage(imgUrl)),
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
    );
  }
}
