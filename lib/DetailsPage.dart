import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String img;
  final String title;
  final String price;
  final BuildContext context;

  DetailsPage(
      {required this.img,
      required this.title,
      required this.price,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/coffee$img.jpg",
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          IconButton(
              padding: EdgeInsets.only(left: 20, top: 40),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                        Text("Cups"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("$title",
                            style: TextStyle(fontSize: 28),
                            ),
                            Text("\$$price",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),)
                          ],
                        ),
                        SizedBox(height: 25,),
                        Row(
                          children: [
                            Expanded(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("SIZE"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("16 oz",style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    ),

                                  ],
                                ),
                            ),
                            Expanded(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("QTY"),
                                    SizedBox(height: 5,),
                                    Text("1",style: TextStyle(
                                      fontSize: 20
                                    ),)
                                  ],
                                ) )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Divider(thickness: 2,
                        ),
                         ListTile(
                           leading: Text("Details",
                           style: TextStyle(fontSize: 18),),
                           trailing: IconButton(
                             icon: Icon(
                               Icons.add,
                               color: Colors.black,
                             ),
                             onPressed: (){},
                           ),
                         ),
                        SizedBox(height: 15,),
                        Divider(
                          thickness: 2,
                        ),
                        ListTile(
                          leading: Text("Shipping & Returns", style: TextStyle(fontSize: 18),
                          ),
              trailing: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: (){},
              ),
                        ),
                        SizedBox(height: 15,),
                        Divider(
                          thickness: 2,
                        )
                      ],
                    ),

                  )),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.favorite_border),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            shape: BoxShape.circle,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 4.8),),
                          icon: Icon(Icons.shopping_bag_outlined),
                          label: Text(
                            "Add to Cart",
                            style: TextStyle(fontSize: 20, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
