// class UserListInObject {
//   int? page;
//   int? perPage;
//   int? total;
//   int? totalPages;
//   List<Data>? data;
//   Support? support;

//   UserListInObject(
//       {this.page,
//         this.perPage,
//         this.total,
//         this.totalPages,
//         this.data,
//         this.support});

//   UserListInObject.fromJson(Map<String, dynamic> json) {
//     page = json['page'];
//     perPage = json['per_page'];
//     total = json['total'];
//     totalPages = json['total_pages'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     support =
//     json['support'] != null ? new Support.fromJson(json['support']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['page'] = this.page;
//     data['per_page'] = this.perPage;
//     data['total'] = this.total;
//     data['total_pages'] = this.totalPages;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (this.support != null) {
//       data['support'] = this.support!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? email;
//   String? firstName;
//   String? lastName;
//   String? avatar;

//   Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     email = json['email'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     avatar = json['avatar'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['email'] = this.email;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['avatar'] = this.avatar;
//     return data;
//   }
// }

// class Support {
//   String? url;
//   String? text;

//   Support({this.url, this.text});

//   Support.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     text = json['text'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['text'] = this.text;
//     return data;
//   }
// }


class CartListInObject {
  List<Cart>? cart;

  CartListInObject({this.cart});

  CartListInObject.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  String? id;
  int? total;
  String? datetime;
  String? orderId;
  List<Items>? items;

  Cart({this.id, this.total, this.datetime, this.orderId, this.items});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    datetime = json['datetime'];
    orderId = json['order_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['datetime'] = this.datetime;
    data['order_id'] = this.orderId;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? item;
  int? price;
  int? quantity;

  Items({this.item, this.price, this.quantity});

  Items.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this.item;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}
