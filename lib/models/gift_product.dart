import 'package:flutter/material.dart';

var defaultAstImg = "images/bgifter.png";
var productImages = [
  AssetImage(defaultAstImg),
  NetworkImage(
    "https://www.signupgenius.com/cms/images/home/valentines-gift-ideas.jpg",
  ),
  NetworkImage(
    "https://www.signupgenius.com/cms/images/home/valentines-gift-ideas.jpg",
  ),
  NetworkImage(
    "https://www.signupgenius.com/cms/images/home/valentines-gift-ideas.jpg",
  ),
  NetworkImage(
    "https://www.signupgenius.com/cms/images/home/valentines-gift-ideas.jpg",
  ),
];

class GiftProduct {
  String id ='123';
  String name;
  double price;
  int rating;
  String description;
  String specification;
  var images;
  String thumbImage;
  var colors;
  String brand;

  GiftProduct(
      {this.id,
      this.name,
      this.price,
      this.rating,
      this.description,
      this.specification,
      this.images,
      this.colors,
      this.brand,
      this.thumbImage});

  GiftProduct.dummy(){
    id = "123";
    name="Demo Gift Pack One For All";
    price= 350;
    rating= 5;
    description=
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
    "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
    "It has survived not only five centuries, but also the leap into electronic typesetting, "
    "remaining essentially unchanged. It was popularised in the 1960s with the release of "
    "Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing "
    "software like Aldus PageMaker including versions of Lorem Ipsum.";
    specification=
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
    "when an unknown printer took a galley of type and scrambled it to make a type "
    "specimen book. It has survived not only five centuries, but also the leap into ";
    colors= ['black', 'red', 'blue'];
    brand= "Universal";
    thumbImage=defaultAstImg;
    images= productImages;
  }

}

var gift = GiftProduct(
    id: "123",
    name: "Gift One",
    price: 350,
    rating: 5,
    description:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
        "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
        "It has survived not only five centuries, but also the leap into electronic typesetting, "
        "remaining essentially unchanged. It was popularised in the 1960s with the release of "
        "Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing "
        "software like Aldus PageMaker including versions of Lorem Ipsum.",
    specification:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
        "when an unknown printer took a galley of type and scrambled it to make a type "
        "specimen book. It has survived not only five centuries, but also the leap into ",
    colors: ['black', 'red', 'blue'],
    brand: "Universal",
    thumbImage:defaultAstImg,
    images: productImages
);
