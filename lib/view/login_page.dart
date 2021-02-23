import 'package:flutter/material.dart';
import 'package:flutter_app1/utils/colors.dart';
import 'package:flutter_app1/utils/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app1/utils/resize.dart';
import 'package:flutter_app1/view/widgets/app_button.dart';
import 'package:flutter_app1/view/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var _Height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //Navigator.of(context); // permite saber la pagina de la navegacion
    //Scaffold.of(context); // mensaje snakbar o toast para
    // mostrar mensajes se saca del scaffold - es un widget
    // estrcutura repetitiva en las pantallas
    // todas la pantallas deben tener un scaffold es la estructura principal
    // de cada pantalla
    //siempre hacer un scaffold que es el lienzo
    return Scaffold(
        body: Container(
      child: Stack(
        //sobre ponder widget
        children: [
          Container(
            //mediaquery agarra el ancho del celular
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/img1.jpeg'),
                  colorFilter: ColorFilter.mode(Colors.white,
                      BlendMode.softLight) // da la opacacidad a la imagen
                  ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: colorBlanco.withAlpha(100),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: resizeH(mediaQ: _Height, size: 80),
                    left: 25,
                    right: 25), //damos un espacio al contenedor
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bienvenido",
                        style: GoogleFonts.signika(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: resizeH(mediaQ: _Height, size: 20),
                        )),
                    Image.asset('assets/img/img3.png',
                        width: resizeH(mediaQ: _Height, size: 157),
                        height: resizeH(mediaQ: _Height, size: 63),
                        fit: BoxFit.contain),
                    Text(
                      "Por favor ingrese para continuar",
                      style: GoogleFonts.signika(
                          fontSize: resizeH(mediaQ: _Height, size: 20),
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    /*
                    Container(
                      //margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.all(width * 0.1),
                      color: Colors.yellow,
                      child: Text(
                        "Example",
                        style: Styles.primaryTextStyles,
                      ),
                    ),
                     */
                    Align(
                      //solo sirve para stack
                      alignment: Alignment.center,
                      child: AppTextField(
                        hintText: 'Username',
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _Height * 0.02,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: AppTextField(
                          hintText: 'Password',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          obscureText: true,
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot password',
                        )),
                    SizedBox(
                      height: _Height * 0.01,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AppButton(
                        text: 'LOG IN ',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/news');
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 500,
                child: SizedBox(),
              ),
              Text(
                'OR',
                style: Styles.secondaryTextStyle,
              ),
              Expanded(
                flex: 1000,
                child: SizedBox(),
              ),
              AppButton(
                text: 'SING UP',
                onPressed: () {},
              ),
              Expanded(
                flex: 1000,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
