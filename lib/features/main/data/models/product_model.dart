class ProductModel  {

  final int id;
  final num price;
  final num oldPrice;
  final num discount;
  final String name ;
  final String description ;
  final String image ;
   bool inCart;
   bool inFav;

  ProductModel({

    required this.inCart,
  required this.inFav
    ,required this.id, required this.price, required this.oldPrice, required this.discount, required this.name, required this.description, required this.image});



}