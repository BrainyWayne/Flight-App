import 'package:Cyclone/CustonShapeCLipper.dart';
import 'package:flutter/material.dart';
import 'package:Cyclone/main.dart';

final Color discountBackGround = Color(0xFFFFE08D);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Colors.grey;

class InheritedFlightListing extends InheritedWidget{
  final String toLocation;
  final String fromLocation;

  InheritedFlightListing({this.fromLocation, this.toLocation, Widget child}) : super(child: child);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedFlightListing of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedFlightListing);



}

TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold);

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

class FlightListing extends StatelessWidget {
 final String toLocation;
  final String fromLocation;

  
  FlightListing({this.fromLocation, this.toLocation});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Result"),
        elevation: 0.0,
        centerTitle: false,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FlightListTopPart(),
            FlightListBottom(),
          ],
        ),
      ),
    );
  }
}

class FlightListBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(

      padding: EdgeInsets.only(left: 16.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16),
            child: Text(

              'Best Deals for Next 6 months ',
              style: dropDownMenuItemStyle,

            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
            ],
          )


        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: <Widget>[
      Container(

        margin: const EdgeInsets.only(right: 16.0, top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: flightBorderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('${'\$4,159.00'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        )),
                    Text('${'\$9,900.00'}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey)),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: <Widget>[
                      FlightDetailChip(Icons.calendar_today, 'June 2019'),
                      Spacer(),
                      Expanded(
                          flex: 5,
                          child: FlightDetailChip(
                              Icons.flight_takeoff, 'Jet Airways')),
                      Spacer(),
                      FlightDetailChip(Icons.star, '4.4'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        height: 100.0,
      ),
      Positioned(
        top: 10.0,
        right: 0.0,

        child: Container(
          margin: EdgeInsets.only(right: 7),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: chipBackgroundColor),
            color: Colors.orange
          ),
          child: Text(
            '55%',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ),
      )
    ]);
  }
}

class FlightDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;

  FlightDetailChip(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black, fontSize: 14.0),
      backgroundColor: Colors.black.withOpacity(0.1),
      avatar: Icon(
        iconData,
        size: 15.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}

class FlightListTopPart extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustonShapeCLipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            height: 160.0,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '$fromLocation',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 20.0,
                          ),
                          Text(
                            '$toLocation',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.import_export,
                          color: Colors.black,
                          size: 32.0,
                        ))
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
