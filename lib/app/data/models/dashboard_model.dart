class DashboardModel {
  double? ordersTotal;
  int? ordersCount;
  double? salesTotal;
  int? salesCount;
  double? averageTicket;
  List<Order>? orders;
  bool? hasMore;
  int? limit;
  int? totalPages;
  int? page;
  int? total;

  DashboardModel({
    this.ordersTotal,
    this.ordersCount,
    this.salesTotal,
    this.salesCount,
    this.averageTicket,
    this.orders,
    this.hasMore,
    this.limit,
    this.totalPages,
    this.page,
    this.total,
  });

  DashboardModel.fromJson(Map<String, dynamic> json) {
    ordersTotal = json['orders_total'];
    ordersCount = json['orders_count'];
    salesTotal = json['sales_total'];
    salesCount = json['sales_count'];
    averageTicket = json['average_ticket'];
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    limit = json['limit'];
    totalPages = json['total_pages'];
    page = json['page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_total'] = ordersTotal;
    data['orders_count'] = ordersCount;
    data['sales_total'] = salesTotal;
    data['sales_count'] = salesCount;
    data['average_ticket'] = averageTicket;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    data['has_more'] = hasMore;
    data['limit'] = limit;
    data['total_pages'] = totalPages;
    data['page'] = page;
    data['total'] = total;
    return data;
  }
}

class Order {
  Customer? customer;
  Seller? seller;
  Payment? payment;
  Delivery? delivery;
  List<Product>? products;
  String? sId;
  Coupon? coupon;
  List<Invoice>? invoices;
  String? orderSellerId;
  String? status;
  Partner? partner;
  String? createdAt;
  String? updatedAt;
  String? userId;
  Refund? refund;
  ReplacementProduct? replacementProduct;

  Order({
    this.customer,
    this.seller,
    this.payment,
    this.delivery,
    this.products,
    this.sId,
    this.coupon,
    this.invoices,
    this.orderSellerId,
    this.status,
    this.partner,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.refund,
    this.replacementProduct,
  });

  Order.fromJson(Map<String, dynamic> json) {
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    payment =
        json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    delivery =
        json['delivery'] != null ? Delivery.fromJson(json['delivery']) : null;
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
    sId = json['_id'];
    coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;
    if (json['invoices'] != null) {
      invoices = <Invoice>[];
      json['invoices'].forEach((v) {
        invoices!.add(Invoice.fromJson(v));
      });
    }
    orderSellerId = json['order_seller_id'];
    status = json['status'];
    partner =
        json['partner'] != null ? Partner.fromJson(json['partner']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['user_id'];
    refund = json['refund'] != null ? Refund.fromJson(json['refund']) : null;
    replacementProduct = json['replacement_product'] != null
        ? ReplacementProduct.fromJson(json['replacement_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    if (delivery != null) {
      data['delivery'] = delivery!.toJson();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    if (invoices != null) {
      data['invoices'] = invoices!.map((v) => v.toJson()).toList();
    }
    data['order_seller_id'] = orderSellerId;
    data['status'] = status;
    if (partner != null) {
      data['partner'] = partner!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['user_id'] = userId;
    if (refund != null) {
      data['refund'] = refund!.toJson();
    }
    if (replacementProduct != null) {
      data['replacement_product'] = replacementProduct!.toJson();
    }
    return data;
  }
}

class Customer {
  String? name;
  String? doc;
  String? email;
  String? phone;

  Customer({this.name, this.doc, this.email, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    doc = json['doc'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['doc'] = doc;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}

class Seller {
  String? id;
  String? name;
  String? email;

  Seller({this.id, this.name, this.email});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class Payment {
  double? amount;
  double? originalAmount;
  String? status;
  double? discount;
  String? method;
  String? transactionId;
  int? installments;
  String? date;

  Payment({
    this.amount,
    this.originalAmount,
    this.status,
    this.discount,
    this.method,
    this.transactionId,
    this.installments,
    this.date,
  });

  Payment.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    originalAmount = json['original_amount'];
    status = json['status'];
    discount = json['discount'];
    method = json['method'];
    transactionId = json['transaction_id'];
    installments = json['installments'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['original_amount'] = originalAmount;
    data['status'] = status;
    data['discount'] = discount;
    data['method'] = method;
    data['transaction_id'] = transactionId;
    data['installments'] = installments;
    data['date'] = date;
    return data;
  }
}

class Delivery {
  List<DeliveryHistory>? history;
  Address? address;
  String? status;
  String? type;
  String? trackId;
  String? trackUrl;
  double? amount;
  String? deliveryForecast;

  Delivery({
    this.history,
    this.address,
    this.status,
    this.type,
    this.trackId,
    this.trackUrl,
    this.amount,
    this.deliveryForecast,
  });

  Delivery.fromJson(Map<String, dynamic> json) {
    if (json['history'] != null) {
      history = <DeliveryHistory>[];
      json['history'].forEach((v) {
        history!.add(DeliveryHistory.fromJson(v));
      });
    }
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    status = json['status'];
    type = json['type'];
    trackId = json['track_id'];
    trackUrl = json['track_url'];
    amount = json['amount'];
    deliveryForecast = json['delivery_forecast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['status'] = status;
    data['type'] = type;
    data['track_id'] = trackId;
    data['track_url'] = trackUrl;
    data['amount'] = amount;
    data['delivery_forecast'] = deliveryForecast;
    return data;
  }
}

class DeliveryHistory {
  Address? address;
  String? status;
  String? type;
  String? trackId;
  String? trackUrl;
  double? amount;
  String? deliveryForecast;

  DeliveryHistory({
    this.address,
    this.status,
    this.type,
    this.trackId,
    this.trackUrl,
    this.amount,
    this.deliveryForecast,
  });

  DeliveryHistory.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    status = json['status'];
    type = json['type'];
    trackId = json['track_id'];
    trackUrl = json['track_url'];
    amount = json['amount'];
    deliveryForecast = json['delivery_forecast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['status'] = status;
    data['type'] = type;
    data['track_id'] = trackId;
    data['track_url'] = trackUrl;
    data['amount'] = amount;
    data['delivery_forecast'] = deliveryForecast;
    return data;
  }
}

class Address {
  String? line1;
  String? line2;
  String? line3;
  String? neighborhood;
  String? city;
  String? state;
  String? postalCode;
  String? countryCode;

  Address({
    this.line1,
    this.line2,
    this.line3,
    this.neighborhood,
    this.city,
    this.state,
    this.postalCode,
    this.countryCode,
  });

  Address.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'];
    line2 = json['line2'];
    line3 = json['line3'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['line1'] = line1;
    data['line2'] = line2;
    data['line3'] = line3;
    data['neighborhood'] = neighborhood;
    data['city'] = city;
    data['state'] = state;
    data['postal_code'] = postalCode;
    data['country_code'] = countryCode;
    return data;
  }
}

class Product {
  String? id;
  String? sellerId;
  String? name;
  int? quantity;
  String? sku;
  String? image;
  String? status;
  double? price;
  double? discount;
  double? originalPrice;
  Rating? rating;
  bool? replacementCoupon;
  Coupon? coupon;
  Promotion? promotion;
  double? amount;
  List<ProductHistory>? history;
  bool? active;
  // TODO: check correct type for replacementProduct
  String? replacementProduct;

  Product({
    this.id,
    this.sellerId,
    this.name,
    this.quantity,
    this.sku,
    this.image,
    this.status,
    this.price,
    this.discount,
    this.originalPrice,
    this.rating,
    this.replacementCoupon,
    this.coupon,
    this.promotion,
    this.amount,
    this.history,
    this.active,
    this.replacementProduct,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    name = json['name'];
    quantity = json['quantity'];
    sku = json['sku'];
    image = json['image'];
    status = json['status'];
    price = json['price'];
    discount = json['discount'];
    originalPrice = json['original_price'];

    if (json['rating'] != null) {
      if (json['rating'] is int) {
        rating = Rating(star: json['rating']);
      } else {
        rating = Rating.fromJson(json['rating']);
      }
    }

    replacementCoupon = json['replacement_coupon'];
    coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;
    promotion = json['promotion'] != null
        ? Promotion.fromJson(json['promotion'])
        : null;
    amount = json['amount'];
    if (json['history'] != null) {
      history = <ProductHistory>[];
      json['history'].forEach((v) {
        history!.add(ProductHistory.fromJson(v));
      });
    }
    active = json['active'];
    replacementProduct = json['replacement_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['seller_id'] = sellerId;
    data['name'] = name;
    data['quantity'] = quantity;
    data['sku'] = sku;
    data['image'] = image;
    data['status'] = status;
    data['price'] = price;
    data['discount'] = discount;
    data['original_price'] = originalPrice;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['replacement_coupon'] = replacementCoupon;
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    if (promotion != null) {
      data['promotion'] = promotion!.toJson();
    }
    data['amount'] = amount;
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    data['active'] = active;
    data['replacement_product'] = replacementProduct;
    return data;
  }
}

class Rating {
  String? title;
  String? description;
  int? star;
  String? date;
  bool? active;

  Rating({this.title, this.description, this.star, this.date, this.active});

  Rating.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    star = json['star'];
    date = json['date'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['star'] = star;
    data['date'] = date;
    data['active'] = active;
    return data;
  }
}

class Promotion {
  double? discount;
  double? percentual;

  Promotion({this.discount, this.percentual});

  Promotion.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    percentual = json['percentual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['discount'] = discount;
    data['percentual'] = percentual;
    return data;
  }
}

class ProductHistory {
  String? id;
  String? sellerId;
  String? name;
  int? quantity;
  String? sku;
  String? image;
  double? amount;
  double? discount;
  double? originalAmount;

  ProductHistory({
    this.id,
    this.sellerId,
    this.name,
    this.quantity,
    this.sku,
    this.image,
    this.amount,
    this.discount,
    this.originalAmount,
  });

  ProductHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    name = json['name'];
    quantity = json['quantity'];
    sku = json['sku'];
    image = json['image'];
    amount = json['amount'];
    discount = json['discount'];
    originalAmount = json['original_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['seller_id'] = sellerId;
    data['name'] = name;
    data['quantity'] = quantity;
    data['sku'] = sku;
    data['image'] = image;
    data['amount'] = amount;
    data['discount'] = discount;
    data['original_amount'] = originalAmount;
    return data;
  }
}

class Coupon {
  String? id;
  String? code;
  String? name;
  double? discount;
  String? type;
  String? application;

  Coupon({
    this.id,
    this.code,
    this.name,
    this.discount,
    this.type,
    this.application,
  });

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    discount = json['discount'];
    type = json['type'];
    application = json['application'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['discount'] = discount;
    data['type'] = type;
    data['application'] = application;
    return data;
  }
}

class Invoice {
  String? id;
  String? createdAt;
  String? status;

  Invoice({this.id, this.createdAt, this.status});

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['status'] = status;
    return data;
  }
}

class Partner {
  String? id;
  String? name;
  String? doc;
  double? salesCommission;
  double? salesPercentual;

  Partner({
    this.id,
    this.name,
    this.doc,
    this.salesCommission,
    this.salesPercentual,
  });

  Partner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    doc = json['doc'];
    salesCommission = json['sales_commission'];
    salesPercentual = json['sales_percentual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['doc'] = doc;
    data['sales_commission'] = salesCommission;
    data['sales_percentual'] = salesPercentual;
    return data;
  }
}

class Refund {
  String? bank;
  String? agency;
  String? account;

  Refund({this.bank, this.agency, this.account});

  Refund.fromJson(Map<String, dynamic> json) {
    bank = json['bank'];
    agency = json['agency'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank'] = bank;
    data['agency'] = agency;
    data['account'] = account;
    return data;
  }
}

class ReplacementProduct {
  String? type;
  String? reason;
  String? comment;
  List<ReplacementProductProduct>? products;

  ReplacementProduct({this.type, this.reason, this.comment, this.products});

  ReplacementProduct.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    reason = json['reason'];
    comment = json['comment'];
    if (json['products'] != null) {
      products = <ReplacementProductProduct>[];
      json['products'].forEach((v) {
        products!.add(ReplacementProductProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['reason'] = reason;
    data['comment'] = comment;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReplacementProductProduct {
  String? sId;
  List<ReplacementProductAttribute>? attributes;
  int? quantity;

  ReplacementProductProduct({this.sId, this.attributes, this.quantity});

  ReplacementProductProduct.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['attributes'] != null) {
      attributes = <ReplacementProductAttribute>[];
      json['attributes'].forEach((v) {
        attributes!.add(ReplacementProductAttribute.fromJson(v));
      });
    }
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    data['quantity'] = quantity;
    return data;
  }
}

class ReplacementProductAttribute {
  String? sId;

  ReplacementProductAttribute({this.sId});

  ReplacementProductAttribute.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    return data;
  }
}
