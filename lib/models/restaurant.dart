class Restaurant {
  final String name;
  final String category;
  final String deliveryTx;
  final String distance;
  final double rate;
  final List<int> time;
  final bool favourite;
  final String photoUrl;

  Restaurant(
      {required this.photoUrl,
      required this.name,
      required this.category,
      required this.deliveryTx,
      required this.distance,
      required this.rate,
      required this.time,
      required this.favourite});

  Restaurant changeFav({
    bool? favourite,
  }) {
    return Restaurant(
      name: name,
      category: category,
      deliveryTx: deliveryTx,
      distance: distance,
      rate: rate,
      time: time,
      favourite: favourite ?? this.favourite,
      photoUrl: photoUrl,
    );
  }
}
