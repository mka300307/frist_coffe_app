import 'package:flutter/material.dart';

class CoffeeMenu extends StatefulWidget {
  @override
  _CoffeeMenuState createState() => _CoffeeMenuState();
}

class _CoffeeMenuState extends State<CoffeeMenu> {
  String selectedCoffee = "All";

  List<Map<String, dynamic>> items = [
    {'name': 'All'},
    {'name': 'Americano'},
    {'name': 'Macchiato'},
    {'name': 'Espresso'},
    {'name': 'Mocha'},
  ];
  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;
    final tinggireal = tinggi - MediaQuery.of(context).padding.top;

    if (selectedCoffee == "All") {
      return buildKategori(status: true);
    } else {
      return buildKategori(status: false);
    }
  }

  Widget buildKategori({bool? status}) {
    final lebar = MediaQuery.of(context).size.width;
    final tinggi = MediaQuery.of(context).size.height;
    final tinggireal = tinggi - MediaQuery.of(context).padding.top;

    if (status == true) {
      return Container(
        width: lebar,
        height: tinggireal * 0.66,
        child: Column(
          children: [
            Container(
              height: 50,
              width: lebar,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                return _buildCoffeeMenuItem(items[index]['name']);
              },separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: lebar*0.05); // Atur jarak di sini
              },
              ),
            ),
            SizedBox(
              height: tinggi * 0.025,
            ),
            Expanded(
              child: CoffeeGrid(selectedCoffee),
            ),
          ],
        ),
      );
    }
    else {
      return Container(
        width: lebar,
        height: tinggireal * 0.36,
        child: Column(
          children: [
            Container(
              height: 50,
              width: lebar,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildCoffeeMenuItem(items[index]['name']);
                },separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: lebar*0.05); // Atur jarak di sini
              },
              ),
            ),
            SizedBox(
              height: tinggi * 0.025,
            ),
            Expanded(
              child: CoffeeGrid(selectedCoffee),
            ),
          ],
        ),
      );
    }

  }

  Widget _buildCoffeeMenuItem(String coffeeName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCoffee = coffeeName;
        });
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            color: (coffeeName == selectedCoffee)
                ? Color(0xFF00512D)
                : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: Text(
            coffeeName,
            style: TextStyle(
              color: (coffeeName == selectedCoffee)
                  ? Colors.white
                  : Color(0xff4d6463),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class CoffeeGrid extends StatelessWidget {
  final String selectedCoffee;

  CoffeeGrid(this.selectedCoffee);

  Map<String, String> coffeeImages = {
    "Americano": "images/amrT.png",
    "Macchiato": "images/mchtT.png",
    "Espresso": "images/expT.png",
    "Mocha": "images/mccT.png",
  };

  Map<String, Map<String, String>> coffeeData = {
    "Americano": {
      "description": "A classic black coffee",
      "price": "\$ 2.50",
      "rate": "4.1"
    },
    "Macchiato": {
      "description": "Espresso Oat Milk ",
      "price": "\$ 3.00",
      "rate": "4.9"
    },
    "Espresso": {
      "description": "A strong and ",
      "price": "\$ 2.00",
      "rate": "4.2"
    },
    "Mocha": {
      "description": "Espresso with chocolate ",
      "price": "\$ 3.50",
      "rate": "4.8"
    },
  };

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    List<String> coffeeItems = [];

    if (selectedCoffee == "All") {
      coffeeItems.addAll(coffeeData.keys);
    } else {
      print(selectedCoffee);
      coffeeItems.add(selectedCoffee);
    }

    return Wrap(
        spacing: 24.0,
        runSpacing: 24.0,
        children: List.generate(coffeeItems.length, (index) {
          var coffeeName = coffeeItems[index];
          final coffeeDescription =
              coffeeData[coffeeName]?["description"] ?? '';
          final coffeePrice = coffeeData[coffeeName]?["price"] ?? '';
          final coffeeRate = coffeeData[coffeeName]?["rate"] ?? '';
          final coffeeImage = coffeeImages[coffeeName] ?? '';
          return (coffeeItems.length > 1)
              ? buildCard(
                  coffeeDescription: coffeeDescription,
                  coffeeName: coffeeName,
                  coffeImage: coffeeImage,
                  coffeePrice: coffeePrice,
                  coffeeRate: coffeeRate,
                  lebar: lebar,
                  status: true)
              : buildCard(
                  coffeeDescription: coffeeDescription,
                  coffeeName: coffeeName,
                  coffeImage: coffeeImage,
                  coffeePrice: coffeePrice,
                  coffeeRate: coffeeRate,
                  lebar: lebar,
                  status: false);
        }));
  }

  Widget buildCard({
    String? coffeeName,
    String? coffeImage,
    String? coffeeDescription,
    String? coffeePrice,
    String? coffeeRate,
    double? lebar,
    bool? status,
  }) {
    if (status! == true) {
      return Container(
        width: lebar! * 0.39,
        height: lebar! * 0.59,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment(0.8, -0.8),
                children: [
                  Container(
                    width: lebar!,
                    height: lebar! * 0.3,
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(coffeImage!)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Container(
                    width: lebar! * 0.12,
                    height: lebar! * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffcf9f69)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_purple500_sharp,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: lebar! * 0.005,
                        ),
                        Text(
                          coffeeRate!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    coffeeDescription!,
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        coffeePrice!,
                        style: TextStyle(
                          color: Color(0xff415a5e),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Color(0xff00512d),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: lebar! * 0.032, right: lebar! * 0.055),
        child: Row(
          children: [
            Container(
              width: lebar! * 0.39,
              height: lebar! * 0.59,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment(0.8, -0.8),
                      children: [
                        Container(
                          width: lebar!,
                          height: lebar! * 0.3,
                          foregroundDecoration: BoxDecoration(
                            image:
                                DecorationImage(image: AssetImage(coffeImage!)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Container(
                          width: lebar! * 0.12,
                          height: lebar! * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffcf9f69)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_purple500_sharp,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                width: lebar! * 0.005,
                              ),
                              Text(
                                coffeeRate!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffeeName!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          coffeeDescription!,
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              coffeePrice!,
                              style: TextStyle(
                                color: Color(0xff415a5e),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xff00512d),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
