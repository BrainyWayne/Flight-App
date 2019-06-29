import 'package:Cyclone/CustonShapeCLipper.dart';
import 'package:Cyclone/SecondPageClipper.dart';
import 'package:Cyclone/flightlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = ThemeData(
      primaryColor: Color(0xFFF3791A),
    );
    return new MaterialApp(
      //Name of te app
      title: 'Cyclone',
      theme: appTheme,
      //Homepage of the app(launcher)
      home: new MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  //Declarations

  TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
  TextStyle dropDownMenuItemStyle = TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold);
  PageController _pageController;
  List<String> locations = ['Kumasi, GH', 'Accra, GH', 'Takoradi, GH'];

  var selectedLocationIndex = 0;
  var isFlightSelected = true;

//settings page numbers to the pages
  int _page = 0;

  Color firstColor = Color(0xFFF47D15);
  Color secondColor = Color(0xFFEF772C);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        children: <Widget>[
          //First Page
          Container(
              color: Colors.white,
              child: SingleChildScrollView(child: firstpage())),

          //Second page
          Container(
              color: Colors.white,
              child: SingleChildScrollView(child: secondPage())),

          //Third PageView
          Container(
              color: Colors.white,
              child: SingleChildScrollView(child: thirdPage())),

          Container(
              color: Colors.white,
              child: SingleChildScrollView(child: fourthPage())),
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              color: Color(0xFFFF0000),
            ),
            title: new Text(
              'Home',
              style: TextStyle(color: Color(0xFFFF0000)),
            ),
          ),
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.favorite,
                color: Colors.orange,
              ),
              title: new Text('Favorites',
                  style: TextStyle(color: Colors.orange))),
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.account_circle,
                color: Colors.green,
              ),
              title:
                  new Text('Profile', style: TextStyle(color: Colors.green))),
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title:
                  new Text('Settings', style: TextStyle(color: Colors.black)))
        ],
        onTap: navigationTapped,
        currentIndex: _page,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }

  //Fourth Page
  Container fourthPage() {
    return new Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ClipPath(
            clipper: SecondPageClipper(),
            child: Container(
              height: 160.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.green[300], Colors.black])),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Third Page
  Container thirdPage() {
    return new Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ClipPath(
            clipper: SecondPageClipper(),
            child: Container(
              height: 240.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.yellow[300], Colors.green[300]])),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Second Page
  Container secondPage() {
    return new Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ClipPath(
            clipper: SecondPageClipper(),
            child: Container(
              height: 320.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFEF772C), Colors.yellow[300]])),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //First Page
  Container firstpage() {
    final _searchFieldController = TextEditingController(text: locations[1]);

    return new Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: CustonShapeCLipper(),
              child: Container(
                height: 400.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFF0000), Color(0xFFEF772C)])),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(height: 70.0),
                          Icon(Icons.location_on, color: Colors.white),
                          SizedBox(
                            height: 16.0,
                            width: 10.0,
                          ),
                          PopupMenuButton(
                            onSelected: (index) {
                              setState(() {
                                selectedLocationIndex = index;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Text(locations[selectedLocationIndex],
                                    style: dropDownLabelStyle),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuItem<int>>[
                                  PopupMenuItem(
                                    child: Text(locations[0]),
                                    value: 0,
                                  ),
                                  PopupMenuItem(
                                    child: Text(locations[1]),
                                    value: 1,
                                  ),
                                  PopupMenuItem(
                                    child: Text(locations[2]),
                                    value: 2,
                                  )
                                ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      'Where would\n you want to go?',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: TextField(
                          controller: _searchFieldController,
                          style: dropDownMenuItemStyle,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 15.0),
                            border: InputBorder.none,
                            suffixIcon: Material(
                              elevation: 2.0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FlightListing(
                                              fromLocation: locations[selectedLocationIndex],
                                              toLocation: _searchFieldController.text)));
                                },
                                child: Icon(Icons.search, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 60.0),
                        InkWell(
                          child: ChoiceChip(Icons.flight_takeoff, "Flights",
                              isFlightSelected),
                          onTap: () {
                            setState(() {
                              isFlightSelected = true;
                            });
                          },
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        InkWell(
                            child: ChoiceChip(
                                Icons.hotel, "Hotels", !isFlightSelected),
                            onTap: () {
                              setState(() {
                                isFlightSelected = false;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //Down part
            bottomFirstPage(),
            bottomFirstPage(),
          ],
        ));
  }

  Padding bottomFirstPage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
              Text(
                'Currently watched items',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 18.0),
              ),
              Spacer(),
              Text(
                'VIEW ALL (12)',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
              SizedBox(
                width: 10.0,
              )
            ],
          ),
          //Down Images
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 230.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: cityCards,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //functions
  void navigationTapped(int page) {
    //Animating to the page
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.35),
              borderRadius: BorderRadius.circular(20.0))
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(widget.icon, size: 20.0, color: Colors.white),
          SizedBox(
            width: 4.0,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

List<CityCard> cityCards = [
  CityCard('assets/images/lasvegas.jpg', "Las Vegas", "Feb 2019", "45", "4299",
      "2250"),
  CityCard(
      'assets/images/athens.jpg', "Athens", "Apr 2019", "50", "9999", "4159"),
  CityCard(
      'assets/images/sydney.jpg', "Sydney", "Dec 2019", "40", "5999", "2399"),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;

  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.newPrice, this.oldPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200.0,
                  width: 160.0,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),

                //Information text background
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 60.0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.1)
                        ])),
                  ),
                ),

                //CityName and the monthYear
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            cityName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0),
                          ),
                          Text(
                            monthYear,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 18.0),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          "$discount%",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: 10.0,
                height: 25.0,
              ),
              Text(
                "£$newPrice",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16.0),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "£($oldPrice)",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontSize: 16.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
