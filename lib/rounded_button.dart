import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String btnText;
  final Function onBtnPressed;

  const RoundedButton({
    Key? key,
    required this.btnText,
    required this.onBtnPressed,
  }) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _isLoading = false;

  void _handleButtonPressed() async {
    setState(() {
      _isLoading = true;
    });

    // Perform some long-running task here, e.g. an API call
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });

    widget.onBtnPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Color(0xFF001945),
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: _isLoading ? 0.0 : 1.0,
            duration: Duration(milliseconds: 300),
            child: InkWell(
              onTap: _handleButtonPressed,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: double.infinity,
                height: 50.0,
                alignment: Alignment.center,
                child: Text(
                  widget.btnText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _isLoading ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: Center(
              child: Container(
                width: 50.0,
                height: 50.0,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
