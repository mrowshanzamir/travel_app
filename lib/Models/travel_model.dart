import 'dart:ui';

class TravelModel {
  String? name;
  String? location;
  String? img;
  int? distance;
  int? temp;
  double? rating;
  String? description;
  int? price;

  TravelModel({required this.name,
    required this.location,
    required this.img,
    required this.distance,
    required this.temp,
    required this.rating,
    required this.description,
    required this.price,});
}

List<TravelModel> travelList = [
  TravelModel(name: "New York",
      location: "US - New York",
      img: "assets/images/NewYork.jpg",
      distance: 7,
      temp: 30,
      rating: 5,
      description: " Ignorant branched humanity led now marianne too strongly entrance. Rose to shew bore no ye of paid rent form. Old design are dinner better nearer silent excuse. She which are maids boy sense her shade. Considered reasonable we affronting on expression in. So cordial anxious mr delight. Shot his has must wish from sell nay. Remark fat set why are sudden depend change entire wanted. Performed remainder attending led fat residence far. ",
      price: 3400),

  TravelModel(name: "Tehran",
      location: "IR - Tehran",
      img: "assets/images/Tehran.jpg",
      distance: 90,
      temp: 28,
      rating: 4,
      description: " Improved own provided blessing may peculiar domestic. Sight house has sex never. No visited raising gravity outward subject my cottage mr be. Hold do at tore in park feet near my case. Invitation at understood occasional sentiments insipidity inhabiting in. Off melancholy alteration principles old. Is do speedily kindness properly oh. Respect article painted cottage he is offices parlors. ",
      price: 3000),

  TravelModel(name: "Paris",
      location: "France - Paris",
      img: "assets/images/Paris.jpg",
      distance: 7,
      temp: 26,
      rating: 5,
      description: " Ham followed now ecstatic use speaking exercise may repeated. Himself he evident oh greatly my on inhabit general concern. It earnest amongst he showing females so improve in picture. Mrs can hundred its greater account. Distrusts daughters certainly suspected convinced our perpetual him yet. Words did noise taken right state are since. ",
      price: 1489),

  TravelModel(name: "Rome",
      location: "Italy - Rome",
      img: "assets/images/Rome.webp",
      distance: 65,
      temp: 32,
      rating: 4.5,
      description: "Rome was called \"the Eternal \" by the ancient Romans because they believed that no matter what happened in the rest of the world, the city of Rome would always remain standing. Exploring the city center by foot surrounded by glorious monuments and colossal remains takes you back in time to the “glory that was Rome.",
      price: 2450),

];