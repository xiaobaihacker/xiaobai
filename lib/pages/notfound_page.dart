import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotfoundPage extends StatelessWidget {
  const NotfoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          height: 500,
          child: Column( children : [
            CircleAvatar(
              foregroundImage: AssetImage('lib/asset/images/dawn.png'),
              radius: 200,
            ),
            Container(
              padding: EdgeInsets.only(top:20),
              child: Text('notFound'.tr),
            ),
          ],
          ),
        ),
      ),
    );
  }
}