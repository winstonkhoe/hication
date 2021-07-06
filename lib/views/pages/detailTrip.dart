import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hication/models/reviews.dart';
import 'package:hication/models/trip.dart';
import 'package:hication/utils/administration.dart';
import 'package:hication/utils/trip-reviews.dart';
import 'package:hication/utils/ui-global.dart';
import 'package:intl/intl.dart';

class DetailTripPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return DetailTripPageState();
  }
}

class DetailTripPageState extends State<DetailTripPage> with SingleTickerProviderStateMixin{

  var _reviewController = TextEditingController();

  var currTrip = getCurrTrip();

  List<Widget> _generateReviewBuild(var tripName)
  {
    List<Widget> _listReviewCard = [];
    for (var i = 0; i < reviewList.length; i++) {
      if(reviewList[i].tripName == tripName)
      {
        _listReviewCard.add(
          Container(
            height: 150,
            width: 400,
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 180,
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image(
                      image: AssetImage('assets/${currTrip.imageDirectory}'),
                      fit: BoxFit.cover
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          // reviewList[i].username,
                          'Winston',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Garamond'
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          reviewList[i].date,
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Garamond',
                            color: Colors.grey
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          reviewList[i].userReview,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Garamond'
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                
              ],
              
            
            
            
            )
          )
        );
      }
    }
    return _listReviewCard;
 
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              // Tab(icon: Icon(Icons.directions_car)),
              Tab(child: Text('Trip')),
              Tab(icon: Icon(Icons.rate_review)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Products 
            ListView(
              children: [
                Container(
                  width: 400,
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image(
                      image: AssetImage('assets/${currTrip.imageDirectory}'),
                      fit: BoxFit.cover
                    ),
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.blue[900],
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                ),
                Container(
                  height: 35,
                  width: 400,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 5),
                  // alignment: Alignment.center,
                  child: Text(
                    currTrip.namaTrip,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.red
                  ),
                ),
                Container(
                  // height: 30,
                  width: 400,
                  margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                  child: Text(
                    currTrip.descTrip,
                    // overflow: TextOverflow.ellipsis,
                    // maxLines: ,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 400,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    currTrip.price,
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 15
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 400,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    currTrip.discountedPrice,
                    style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 20
                    ),
                  )
                ),
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      hintText: 'Tell me about your trip experience'
                    ),
                    controller: _reviewController,
                  ),
                  decoration: BoxDecoration(
                    color: randomizeColor(),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: TextButton(
                    onPressed: () {
                      if(_reviewController.text == '')
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Review must not be empty!'))
                        );
                      }
                      else
                      {
                        var now = new DateTime.now();
                        var formatter = new DateFormat('d MMM yyyy');
                        String formattedDate = formatter.format(now);
                        reviewList.add(Reviews(currTrip.namaTrip, getCurrentUsername(), _reviewController.text, formattedDate.toString()));
                        setState(() {
                          _reviewController.text = '';
                          reviewList;
                        });
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(randomizeColor()),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                )
              ],
            ),
            ListView(
              children: _generateReviewBuild(currTrip.namaTrip)
            )
          ],
        )
      )
    );
  }

  
}