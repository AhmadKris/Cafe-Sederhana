class Items {
  String? idItem;
  String name;
  String price;
  String qty;

  Items({
    this.idItem,
    required this.name,
    required this.price,
    required this.qty,
  });

  factory Items.fromMap(Map<dynamic, dynamic> map) {
    return Items(
      idItem: map['key'] as String,
      name: map['nama'] as String,
      price: map['harga'] as String,
      qty: map['jumlah'] as String,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'key': idItem,
      'nama': name,
      'harga': price,
      'jumlah': qty,
    };
  }

  // static Map<dynamic, dynamic> toOrderMap(List<Items> cartItems) {
  //   Map<dynamic, dynamic> orderMap = <dynamic, dynamic>{};
  //   for (Items item in cartItems) {
  //     orderMap[] = {
  //       'key': item.idItem,
  //       'nama': item.name,
  //       'harga':item.price,
  //       'jumlah':item.qty,
  //     };
  //   }
  //   return orderMap;
  // }

  static toOrderItemList(var map) {
    Map values = map as Map;
    List<Items> cartItem = [];
    values.forEach((key, data) {
      final Items connect = Items.fromMap(data);
      cartItem.add(connect);
    });
    return cartItem;
  }
}
