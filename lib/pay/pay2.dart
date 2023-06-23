import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/pay/pay3.dart';

class Pay2 extends StatelessWidget {
   Pay2({Key? key,required this.image }) : super(key: key);
GlobalKey<FormState> key1 = GlobalKey<FormState>();
String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100),
                Text(
                  'Your Information',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Required fields are followed by * ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'First Name',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w500,
                    ),
                    
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Enter Value";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 206, 206, 206),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey),
          
                    )
          
                  ),
                ),
              
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Last Name',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w500,
                    ),
                    
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Enter Value";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 206, 206, 206),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey),
          
                    )
          
                  ),
                ),
              
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w500,
                    ),
                    
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Enter Value";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 206, 206, 206),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey),
          
                    )
          
                  ),
                ),
              
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Phone',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w500,
                    ),
                    
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Enter Value";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 206, 206, 206),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey),
          
                    )
          
                  ),
                ),
              
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Country',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w500,
                    ),
                    
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Enter Value";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 206, 206, 206),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey),
          
                    )
          
                  ),
                ),
              
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Zip Code',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w500,
                    ),
                    
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                   validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Enter Value";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 206, 206, 206),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey),
          
                    )
          
                  ),
                ),
              SizedBox(height: 20),
               ElevatedButton(
                onPressed: () {
                  if(key1.currentState!.validate()){

                  Navigator.push(context, MaterialPageRoute(builder: (e)=> Pay3(image: image,)));
                  }
                },
                child: Text("Next"),
              ),
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
