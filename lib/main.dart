import 'package:flutter/material.dart';
import 'package:shop_app/DetailsPage.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade500,
                      spreadRadius: 0.5)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainerBottomNav(Icons.person),
                buildContainerBottomNav(Icons.shopping_bag),
                buildContainerBottomNav(
                  Icons.home,
                  isSelected: true,
                ),
                buildContainerBottomNav(Icons.favorite),
                buildContainerBottomNav(Icons.settings),
              ],
            ),
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            elevation: 0,
            leading: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                Icons.window,
                color: Colors.blueGrey,
                size: 30.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
            actions: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: Colors.blueGrey,
                  size: 30.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              )
            ]),
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "  shop",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "app",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildElevatedButton("Home Decore", isSelected: true),
              buildElevatedButton("Decoration"),
              buildElevatedButton("Store"),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        spreadRadius: 1,
                        blurRadius: 20,
                      ),
                    ]),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildColumnAtTop("Cups", isSelected: true),
                          buildColumnAtTop("Vases"),
                          buildColumnAtTop("Bins"),
                          buildColumnAtTop("Floral"),
                          buildColumnAtTop("Decor"),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      MyCupsList(),
                      SizedBox(
                        height: 20,
                      ),
                      LineBar(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Diwali Sale",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "view all",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildbottomContainer(
                                "4", "Natural Designs", "15", "16oz"),
                            buildbottomContainer(
                                "1", "Sprinkled", "20", "22oz"),
                            buildbottomContainer("3", "Cup", "12", "5oz"),
                            buildbottomContainer("2", "Espanshe", "22", "2oz"),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ]),
      ),
    );
  }

  Container buildContainerBottomNav(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        shape: BoxShape.circle,
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1)]
            : [],
      ),
      height: 50,
      width: 50,
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }

  Container buildbottomContainer(
      String img, String title, String price, String text) {
    return Container(
      height: 150,
      color: Colors.grey.shade300,
      width: 220,
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SizedBox(
                height: 200,
                width: 100,
                child: Image.asset(
                  "assets/images/coffee$img.jpg",
                  fit: BoxFit.cover,
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title),
              Text(
                text,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Spacer(),
              Text(
                "\$ $price",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }

  Column buildColumnAtTop(String text, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey, fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        if (isSelected)
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  ElevatedButton buildElevatedButton(String text, {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        primary: isSelected ? Colors.black : Colors.grey,
        onPrimary: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class LineBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.height);
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade300,
      margin: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.centerLeft,
      child: Container(
        width: 100,
        height: 5,
        color: Colors.black,
      ),
    );
  }
}

class MyCupsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          buildColoumnWithRow("3", "espanshe", "44", context),
          buildColoumnWithRow("2", "Chococup", "104", context),
          buildColoumnWithRow("1", "caffeyano", "24", context),
          buildColoumnWithRow("4", "Esppresso", "54", context),
        ],
      ),
    );
  }

  GestureDetector buildColoumnWithRow(
      String img, String title, String price, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsPage(img:img,title: title,context: context,price: price,);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 290,
              width: 210,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/coffee$img.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 15,),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "\$ $price",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
