import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/modules/login/login_screen.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          titleSpacing: 0.0,
          leading: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_circle_left_sharp,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
          title: Transform(
            transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.help,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Create New Password",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your password must be diffrent from previous used passwords",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Confirm Password',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: Text(
                    "Reset Password ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
