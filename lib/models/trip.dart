String priceToStringConverter(var price)
{
  var currString = price.toString();
  var newString = 'Rp ';
  for(int i = 0 ; i < currString.length; i++)
  {
    if(i%3 == currString.length%3 && i != 0)
        newString += '.';
      
    newString += currString[i];
  }
  return newString;
}

class Trip {
  late String imageDirectory, namaTrip, descTrip, location, price, discountedPrice, type;

  Trip(imageDirectory, namaTrip, descTrip, location, type, price, discountedPrice)
  {
    this.imageDirectory = imageDirectory;
    this.namaTrip = namaTrip;
    this.descTrip = descTrip;
    this.location = location;
    this.type = type;
    this.price = priceToStringConverter(price.toInt());
    this.discountedPrice = priceToStringConverter((discountedPrice * price).toInt());
  }
}