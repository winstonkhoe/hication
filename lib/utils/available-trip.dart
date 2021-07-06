import 'package:hication/models/trip.dart';
import 'package:hication/models/user.dart';

var _discountedPrice = 0.85;

List<Trip> tripList = [
  Trip('mountain-view/1.jpg', 'Mt. Prau', 'Lightweight Hiking with Beautiful Scenery', 'Central Java', 'hot', 1000000, _discountedPrice),
  Trip('mountain-view/2.jpg', 'Mt. Semeru', 'Its all about its lake', 'East Java', 'hot', 3250000, _discountedPrice),
  Trip('mountain-view/3.jpg', 'Mt. Kilimanjaro', 'Lightweight Hiking with Beautiful Scenery', 'Tanzania', 'hot', 5000000, _discountedPrice),
  Trip('mountain-view/4.jpg', 'Mt. Kerinci', 'Hike and chill!', 'West Sumatra', 'hot', 2500000, _discountedPrice),
  Trip('mountain-view/5.jpg', 'Mt. Argopuro', 'A Week of Savana and Amazing Danau Taman Hidup', 'East Java', 'hot', 1000000, _discountedPrice),
  Trip('mountain-view/6.jpg', 'Mt. Rinjani', "The heavy hike is worth it!", 'West Nusa Tenggara', 'hot', 3300000, _discountedPrice),
  Trip('mountain-view/7.jpg', 'Taman Nasional Baluran', "Indonesia's savana a.k.a Africa van Java", 'East Java', 'cheap', 1000000, _discountedPrice),
  Trip('mountain-view/8.jpg', 'Mt. Raung', 'It will be thirsty!', 'East Java', 'cheap', 1500000, _discountedPrice),
  Trip('mountain-view/9.jpg', 'Mt. Batu Karu', 'Lightweight Hiking with Beautiful Scenery', 'Jawa Tengah', 'cheap', 1000000, _discountedPrice),
  Trip('mountain-view/10.jpg', 'Bedugul', 'Outbond and Chill', 'Bali', 'cheap', 750000, _discountedPrice),
  Trip('mountain-view/11.jpg', 'Mt. Gede', 'Hiking Exercise', 'West Java', 'cheap', 750000, _discountedPrice),
];

// _tripList.add(Trip('mountain-view/1.jpg', 'Lightweight Hiking with Beautiful Scenery', 'Jawa Tengah', 1000000));