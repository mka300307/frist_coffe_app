import 'package:flutter/material.dart';

class WidgetListBarista extends StatefulWidget {
  const WidgetListBarista({Key? key}) : super(key: key);

  @override
  State<WidgetListBarista> createState() => _WidgetListBaristaState();
}

class _WidgetListBaristaState extends State<WidgetListBarista> {

  final List<Map<String, dynamic>> items = [
    {
      'image' : 'images/aga.png',
      'name':'Muhammad Aga',
      'specialis': 'Americano',
      'rate' : '4.7',
    },
    {
      'image' : 'images/tanu.png',
      'name':'Yoshua Tanu',
      'specialis': 'Macchiato',
      'rate' : '4.0',
    },
    {
      'image' : 'images/ryan.png',
      'name':'Ryan Wibawa',
      'specialis': 'Espresso',
      'rate' : '4.8',
    },
    {
      'image' : 'images/jasin.png',
      'name':'Mikael Jasin',
      'specialis': 'Mocha',
      'rate' : '4.5',
    },
  ];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.9,
      height: size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width*0.8,
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.0), // Reduced padding
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        height: size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(items[index]["image"]),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start, // Adjusted alignment
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height*0.02,),// Reduced spacing
                          Container(
                            width: size.width * 0.4,
                            child: Text(
                              items[index]['name'],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height*0.004,),
                          Row(
                            children: [
                              Text("Specialis: ",style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),),
                              Row(
                                children: [
                                  Text(items[index]['specialis'],style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Rate: ",style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),),
                              Row(
                                children: [
                                  Icon(Icons.star,size: 20,color: Colors.yellow,),
                                  Text(items[index]['rate'],style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
      }),
    );
  }
}
