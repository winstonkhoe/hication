// import 'package:flutter/cupertino.dart'; //--> Widget untuk IOS
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hication/utils/administration.dart';
import 'package:hication/utils/available-trip.dart';
import 'package:hication/utils/trip-reviews.dart';
import 'package:hication/utils/ui-global.dart' as globals;
import 'package:hication/views/pages/allTrips.dart';
import 'package:hication/views/pages/detailTrip.dart';
import 'package:hication/views/pages/home.dart';
import 'package:hication/views/pages/login.dart';

class AllTripsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllTripsPageState();
  }
}

class AllTripsPageState extends State<AllTripsPage> {
List<Widget> _imageBuilder()
  {
    List<Widget> listImage = [];
    for(int i = 0; i < tripList.length; i++)
    {
      listImage.add(
        Image(image: AssetImage('assets/${tripList[i].imageDirectory}'))
      );
    }
    return listImage;
  }

List<Widget> _tripDetailBuilder(BuildContext ctx)
  {
    List<Widget> _listCard = [];
    for(int i = 0; i < tripList.length; i++)
    {
      _listCard.add(
        GestureDetector(
          onTap: () => {
            setCurrTrip(tripList[i]),
            Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => DetailTripPage()))
          },
          child: Container(
            height: 150,
            width: 400,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: [
                
                //CARD - TOP (Image and Location)
                Stack(
                  children: [
                    Container(
                      width: 180,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Image(
                          image: AssetImage('assets/${tripList[i].imageDirectory}'),
                          fit: BoxFit.cover
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child:
                        // Location
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            tripList[i].location,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Garamond'
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15) 
                            )
                          ),
                        ),
                    )
                  ],
                ),
                //Bottom DESC
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: 170,
                  height: 200,
                  child: 
                    Column(
                      children: [
                        Container(
                          height: 20,
                          width: 200,
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 5),
                          child: Text(
                            tripList[i].namaTrip,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Garamond'
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 170,
                          margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                          child: Text(
                            tripList[i].descTrip,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Garamond'
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 170,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            tripList[i].price,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              fontFamily: 'Garamond'
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 170,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            tripList[i].discountedPrice,
                            style: TextStyle(
                              color: Colors.red[700],
                              fontSize: 15,
                              fontFamily: 'Garamond'
                            ),
                          )
                        ),
                      ],
                    ),
                    
                  )
              ],
            ),
            
          )
        )
        
      );
    }
    return _listCard;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: globals.darkThemeEnabled? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.chevron_left_sharp)),
        title: 
          Row(
            children: [
              Container(
                height: 25,
                child: Image(
                  image: AssetImage('assets/logo-simple.png'),
                  fit: BoxFit.fitHeight
                ),
              ),
            ],
          ),
        backgroundColor: globals.randomizeColor(),
        
        actions: [
        PopupMenuButton(itemBuilder: (context){
          return ['Toggle'].map((e){
            return PopupMenuItem(child: TextButton(
              onPressed: () {
                setState(() {
                  globals.darkThemeEnabled = !globals.darkThemeEnabled;
                });
              }, 
              child: globals.themeButton()
            )
              );
          }).toList();
          }),
        ],
      ),
      body: ListView(
        children: _tripDetailBuilder(context)
      )
      ),
    );
  }
}