import 'package:flutter/material.dart';

class WidgetDiskon extends StatefulWidget {
  const WidgetDiskon({Key? key}) : super(key: key);

  @override
  State<WidgetDiskon> createState() => _WidgetDiskonState();
}

class _WidgetDiskonState extends State<WidgetDiskon> {

  final List<Map<String, dynamic>> items = [
    {
      'text': 'Discount Sales',
      'image': 'images/amr.png',
      'desc': 'Buy one Americano get one Mocca',
    },
    {
      'text': 'Voucher',
      'image': 'images/mcht.png',
      'desc': 'Get vouncher All Coffe disccount 50%',
    },
    {
      'text': 'Item 3',
      'image': 'images/mcc.png',
      'desc': 'Description 3',
    },
    {
      'text': 'Item 4',
      'image': 'images/exp.png',
      'desc': 'Description 4',
    },
  ];



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width*0.9,
          height: size.height * 0.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: items.length ,
              itemBuilder: (context, index) {
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
                          SizedBox(width: size.width * 0.02),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start, // Adjusted alignment
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height*0.02,),
                              Container(
                                width: size.width * 0.2,
                                height: size.height * 0.02,
                                decoration: BoxDecoration(
                                  color: Color(0xffcf9f69),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    items[index]['text'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: size.width * 0.01), // Reduced spacing
                              Container(
                                width: size.width * 0.4,
                                child: Text(
                                  items[index]["desc"],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),

      ],
    );
  }
}
