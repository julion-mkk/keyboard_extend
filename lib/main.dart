import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KeyboardExtendScreen(),
    );
  }
}

class KeyboardExtendScreen extends StatefulWidget {
  @override
  _KeyboardExtendScreenState createState()=> _KeyboardExtendScreenState();
}

class _KeyboardExtendScreenState extends State<KeyboardExtendScreen> {
  double left = 0;
  double right = 0;
  double top = 0;
  double bottom = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      left = 0;
      //right = MediaQuery.of(context).size.width/2;
      top = 0;
      //bottom = MediaQuery.of(context).size.height/2;
      /*left = MediaQuery.of(context).size.width/2;
      right = MediaQuery.of(context).size.width/2;
      top = MediaQuery.of(context).size.height/2;
      bottom = MediaQuery.of(context).size.height/2;*/

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keyboard Extend'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                left: 10,
                right: 0,
                top: top,
                bottom: bottom,
                child: Icon(Icons.person,color: Colors.red, size: 30,),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width/2 - 20,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    bottom += 10;
                  });
                },
                child: Text('Up',style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xffffffff)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                  )
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/2 - 20,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    top += 12;
                  });
                },
                child: Text('Down',style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xffffffff)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
