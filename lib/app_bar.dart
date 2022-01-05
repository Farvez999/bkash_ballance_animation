import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isAnimation = false;
  bool _isBallanceShown = false;
  bool _isBallance = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.pink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          userLogo(),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///User Name
              Text(
                'Farvez Abdullah',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 5,
              ),

              ///Button
              InkWell(
                  onTap: changeState,
                  child: Container(
                      width: 160,
                      height: 28,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Stack(alignment: Alignment.center, children: [
                        ///৳ 50.00
                        AnimatedOpacity(
                            opacity: _isBallanceShown ? 1 : 0,
                            duration: Duration(milliseconds: 500),
                            child: Text('৳ 50.00',
                                style: TextStyle(
                                    color: Colors.pink, fontSize: 14))),

                        /// ব্যালেন্স দেখুন
                        AnimatedOpacity(
                            opacity: _isBallance ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: const Text('ব্যালেন্স দেখুন',
                                style: TextStyle(
                                    color: Colors.pink, fontSize: 14))),

                        /// Circle
                        AnimatedPositioned(
                            duration: const Duration(milliseconds: 1100),
                            left: _isAnimation == false ? 5 : 135,
                            curve: Curves.fastOutSlowIn,
                            child: Container(
                                height: 20,
                                width: 20,
                                // padding: const EdgeInsets.only(bottom: 4),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const FittedBox(
                                    child: Text('৳',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17)))))
                      ])))
            ],
          ),
          SizedBox(
            width: 10,
          ),
          //Bkash Logo
          bkashLogo()
        ],
      ),
    );
  }

  bkashLogo() => 
  SizedBox(width: 45, child: Image.asset('assets/bKash.png'));

  Widget userLogo() => CircleAvatar(
      backgroundColor: Colors.green.shade50,
      radius: 20,
      child: Icon(
        Icons.person,
        color: Colors.pink,
        size: 28,
      ));

  void changeState() async {
    _isAnimation = true;
    _isBallance = false;
    setState(() {});

    await Future.delayed(Duration(milliseconds: 800),
        () => setState(() => _isBallanceShown = true));
    await Future.delayed(
        Duration(seconds: 3), () => setState(() => _isBallanceShown = false));
    await Future.delayed(Duration(milliseconds: 200),
        () => setState(() => _isAnimation = false));
    await Future.delayed(
        Duration(milliseconds: 800), () => setState(() => _isBallance = true));
  }
}
