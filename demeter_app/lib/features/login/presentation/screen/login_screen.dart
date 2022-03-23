import 'package:flutter/material.dart';
import 'package:demeter_app/features/home/export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/1.jpg'), fit: BoxFit.fill)),
          padding: const EdgeInsets.only(
            top: 300,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const  Color.fromARGB(54, 0, 18, 118),
                const Color(0xFF1C1C1C).withOpacity(0.8)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 1],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
       const  Center(
           child: Text(
              'DEMETER',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Proxima Nova Extrabold',
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
         ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: 150.0,
          bottom: 20.0,
          child: Container( 
            alignment: Alignment.center,
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    height: 48.0,
                    minWidth: MediaQuery.of(context).size.width,
                    child: RaisedButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        icon: Image.asset('images/git.png'),
                        color: Colors.white,
                        label: Text('Login com o GitLab',
                            style: TextStyle(
                                color: Color(0xFF364976),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)))),
              ),
                      Image.asset('images/fundo.png')
            ]),
          ),
        )
      ],
    )));
  }
}
