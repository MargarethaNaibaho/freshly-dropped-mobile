import 'package:flutter/material.dart';

import 'package:freshy_food/base/botton_nav.dart';
import 'package:freshy_food/colors.dart';
import 'package:freshy_food/screens/home_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pushAndRemoveUntil(
                        context, 
                        MaterialPageRoute(builder: (context) => BottomNavBar()),
                        (Route<dynamic> route) => false,
                        );
                    }, icon: 
                      Icon(Icons.keyboard_arrow_left_rounded, size: 40, color: CustomColors.lightGreen),
                    ),
                    Text(
                      "Info",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        color: CustomColors.primaryGreen
                      ),
                    ),
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.add, size: 40, color: CustomColors.lightGreen,),),
                  ],
                ),
              )
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Image.asset(
              'assets/images/green_logo.png',
              width: 254,
              alignment: Alignment.center,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.only(bottom: 33),
            child: Text(
              "\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lacinia blandit eleifend. Proin tristique lacus facilisis diam tempor, non congue justo faucibus. \n\n\tNam scelerisque arcu a sapien facilisis, blandit pellentesque enim ornare. Donec vitae lacus commodo, vehicula erat et, molestie neque. Cras nec ornare augue. Quisque at condimentum elit, nec volutpat nulla.\n\n\tSuspendisse finibus nibh ac augue pulvinar, at laoreet lacus sollicitudin. Donec tempor, dui non imperdiet semper, sapien eros vulputate lectus, in euismod nisi ante a lacus.",
              style: TextStyle(
                fontSize: 16,
                height: 1.2,
                color: CustomColors.primaryGrey,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Contact us:", 
                style: TextStyle(
                  fontFamily: 'Poppins', 
                  fontSize: 20,
                  color: CustomColors.primaryGrey,
                ),
              ),
              const SizedBox(height: 16,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FluentSystemIcons.ic_fluent_phone_regular, size: 23, color: CustomColors.primaryGrey,),
                      const SizedBox(width: 5,),
                      Text(
                        "+1 234 567 890",
                        style: TextStyle(
                          fontFamily: 'Poppins', 
                          fontSize: 20,
                          color: CustomColors.primaryGrey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FluentSystemIcons.ic_fluent_mail_regular, size: 23, color: CustomColors.primaryGrey,),
                      const SizedBox(width: 5,),
                      Text(
                        "cs@freshlydropped.com",
                        style: TextStyle(
                          fontFamily: 'Poppins', 
                          fontSize: 20,
                          color: CustomColors.primaryGrey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FluentSystemIcons.ic_fluent_chat_filled, size: 23, color: CustomColors.primaryGrey,),
                      const SizedBox(width: 5,),
                      Text(
                        "Live Agent",
                        style: TextStyle(
                          fontFamily: 'Poppins', 
                          fontSize: 20,
                          color: CustomColors.primaryGrey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          
        ],
      )
    );
  }
}