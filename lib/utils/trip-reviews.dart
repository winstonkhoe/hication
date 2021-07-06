import 'package:hication/models/reviews.dart';
import 'package:hication/models/trip.dart';

List<Reviews> reviewList = [];

var currentTrip = null;

void setCurrTrip(Trip curr)
{
  currentTrip = curr;
}

Trip getCurrTrip()
{
  return currentTrip;
}