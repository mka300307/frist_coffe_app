import 'package:flutter/material.dart';

class WidgetAvatar extends StatelessWidget {
  const WidgetAvatar({Key? key}) : super(key: key);


  Widget TextTimes (BuildContext context){
    String getGreeting() {
      final currentTime = DateTime.now();
      final hour = currentTime.hour;

      if (hour >= 0 && hour < 5) {
        return 'GOOD DAWN';
      } else if (hour >= 5 && hour < 11) {
        return 'GOOD MORNING';
      } else if (hour >= 11 && hour < 15) {
        return 'GOOD AFTERNOON';
      } else if (hour >= 15 && hour < 19) {
        return 'GOOD EVENING';
      } else {
        return 'GOOD NIGHT';
      }
    }
    return Text(
        getGreeting(),
        style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
           ));
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size ;
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.width*0.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.15,
                height: size.width * 0.15,
                foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/gebi.jpg")
                  ),
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.notifications_none,size: size.width*0.1,color: Color(
                      0xff382e1e),))
            ],
          ),
        ),
        SizedBox(height: size.height* 0.02,),
        Row(
          children: [
            TextTimes(context),
            Text(", Gebii!",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
          
      ],
    );
  }
}


