import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hication/utils/administration.dart';
import 'package:hication/utils/available-trip.dart';
import 'package:hication/utils/trip-reviews.dart';
import 'package:hication/utils/ui-global.dart' as globals;
import 'package:hication/views/pages/allTrips.dart';
import 'package:hication/views/pages/detailTrip.dart';
import 'package:hication/views/pages/login.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

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

List<Widget> _tripBuilder(var type, BuildContext ctx)
  {
    List<Widget> _listCard = [];
    for(int i = 0; i < tripList.length; i++)
    {
      if(tripList[i].type == type)
      {
      _listCard.add(
        GestureDetector(
          onTap: () => {
            setCurrTrip(tripList[i]),
            Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => DetailTripPage()))
          },
          child:
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                
                //CARD - TOP (Image and Location)
                Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Image(
                          image: AssetImage('assets/${tripList[i].imageDirectory}'),
                          fit: BoxFit.cover
                        ),
                      ),
                      decoration: BoxDecoration(
                        // color: Colors.blue[900],
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child:
                        // Location
                        Container(
                          alignment: Alignment.center,
                          // width: 70,
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
                  width: 150,
                  height: 25,
                  child: 
                    Column(
                      children: [
                        Text(
                          tripList[i].namaTrip,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Garamond'
                          ),
                        ),
                        Text(
                          tripList[i].descTrip,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Garamond'
                          ),
                        ),
                      ],
                    )
                ),
                Text(
                  tripList[i].price,
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 8,
                    fontFamily: 'Garamond'
                  ),
                ),
                Text(
                  tripList[i].discountedPrice,
                  style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 10,
                    fontFamily: 'Garamond'
                  ),
                )
              ],
            ),
          )
        )
      );
    }
    }
    return _listCard;
  }


class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: globals.darkThemeEnabled? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
        
        title: 
          Row(
            children: [
              Container(
                height: 25,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image(
                  image: AssetImage('assets/logo-simple.png'),
                  fit: BoxFit.fitHeight
                ),
              ),
              Text(
                'Hello, ${getCurrentUsername()}',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Garamond'
                )
              ,),
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
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: TextButton(
                child: Text('Home'),
                onPressed: null
                ),
            ),
            ListTile(
              title: TextButton(
                child: Text('All Trip'),
                onPressed: () => {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => AllTripsPage()),
                  )
                }
              ),
            ),
            ListTile(
              title: TextButton(
                child: Text('Logout'),
                onPressed: () => {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  )
                }
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            // margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child:
            CarouselSlider(
              items: _imageBuilder(),
              options: CarouselOptions(
                initialPage: 0,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                pageSnapping: true
              ),
            ),
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 310,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Hication is a travel service provider for all your outdoor adventures. We provide booking, planning, and porter services for trips to your hikes, camps, and other various activities.',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Garamond'
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: 
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Famous Trip',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Garamond'
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: InkWell(
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Garamond'
                              ),
                            ),
                            onTap: () => Navigator.push(
                                          context, 
                                          MaterialPageRoute(
                                            builder: (context)=> AllTripsPage()
                                            )
                            ),
                          )
                        ),
                      )
                    ],
                  )
              ),
              
              Container(
                height: 230,
                child:
                  ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: _tripBuilder('hot', context)
                  )
              )
            ],
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: 
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Hot Cheap Trip',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Garamond'
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: InkWell(
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Garamond'
                              ),
                            ),
                            onTap: () => Navigator.push(
                                          context, 
                                          MaterialPageRoute(
                                            builder: (context)=> AllTripsPage()
                                            )
                            ),
                          )
                        ),
                      )
                    ],
                  )
              ),
              
              Container(
                height: 230,
                child:
                  ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: _tripBuilder('cheap', context)
                  )
              )
            ],
          )
        ]
      )
      ),
    );
  }
}