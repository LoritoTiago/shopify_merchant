// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final List<Product>? products;

  ProductModel({
    this.products,
  });

  ProductModel copyWith({
    List<Product>? products,
  }) =>
      ProductModel(
        products: products ?? this.products,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  final int? id;
  final String? title;
  final String? bodyHtml;
  final String? vendor;
  final String? productType;
  final DateTime? createdAt;
  final String? handle;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final dynamic templateSuffix;
  final PublishedScope? publishedScope;
  final String? tags;
  final String? status;
  final String? adminGraphqlApiId;
  final List<Variant>? variants;
  final List<Option>? options;
  final List<ImageProduct>? images;
  final ImageProduct? image;

  Product({
    this.id,
    this.title,
    this.bodyHtml,
    this.vendor,
    this.productType,
    this.createdAt,
    this.handle,
    this.updatedAt,
    this.publishedAt,
    this.templateSuffix,
    this.publishedScope,
    this.tags,
    this.status,
    this.adminGraphqlApiId,
    this.variants,
    this.options,
    this.images,
    this.image,
  });

  Product copyWith({
    int? id,
    String? title,
    String? bodyHtml,
    String? vendor,
    String? productType,
    DateTime? createdAt,
    String? handle,
    DateTime? updatedAt,
    DateTime? publishedAt,
    dynamic templateSuffix,
    PublishedScope? publishedScope,
    String? tags,
    String? status,
    String? adminGraphqlApiId,
    List<Variant>? variants,
    List<Option>? options,
    List<ImageProduct>? images,
    ImageProduct? image,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        bodyHtml: bodyHtml ?? this.bodyHtml,
        vendor: vendor ?? this.vendor,
        productType: productType ?? this.productType,
        createdAt: createdAt ?? this.createdAt,
        handle: handle ?? this.handle,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
        templateSuffix: templateSuffix ?? this.templateSuffix,
        publishedScope: publishedScope ?? this.publishedScope,
        tags: tags ?? this.tags,
        status: status ?? this.status,
        adminGraphqlApiId: adminGraphqlApiId ?? this.adminGraphqlApiId,
        variants: variants ?? this.variants,
        options: options ?? this.options,
        images: images ?? this.images,
        image: image ?? this.image,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        bodyHtml: json["body_html"],
        vendor: json["vendor"],
        productType: json["product_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        handle: json["handle"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        templateSuffix: json["template_suffix"],
        publishedScope: publishedScopeValues.map[json["published_scope"]]!,
        tags: json["tags"],
        status: json["status"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<ImageProduct>.from(
                json["images"]!.map((x) => ImageProduct.fromJson(x))),
        image:
            json["image"] == null ? null : ImageProduct.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body_html": bodyHtml,
        "vendor": vendor,
        "product_type": productType,
        "created_at": createdAt?.toIso8601String(),
        "handle": handle,
        "updated_at": updatedAt?.toIso8601String(),
        "published_at": publishedAt?.toIso8601String(),
        "template_suffix": templateSuffix,
        "published_scope": publishedScopeValues.reverse[publishedScope],
        "tags": tags,
        "status": status,
        "admin_graphql_api_id": adminGraphqlApiId,
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "image": image?.toJson(),
      };
}

class ImageProduct {
  final int? id;
  final dynamic alt;
  final int? position;
  final int? productId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? adminGraphqlApiId;
  final int? width;
  final int? height;
  final String? src;
  final List<dynamic>? variantIds;

  ImageProduct({
    this.id,
    this.alt,
    this.position,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.adminGraphqlApiId,
    this.width,
    this.height,
    this.src,
    this.variantIds,
  });

  ImageProduct copyWith({
    int? id,
    dynamic alt,
    int? position,
    int? productId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? adminGraphqlApiId,
    int? width,
    int? height,
    String? src,
    List<dynamic>? variantIds,
  }) =>
      ImageProduct(
        id: id ?? this.id,
        alt: alt ?? this.alt,
        position: position ?? this.position,
        productId: productId ?? this.productId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        adminGraphqlApiId: adminGraphqlApiId ?? this.adminGraphqlApiId,
        width: width ?? this.width,
        height: height ?? this.height,
        src: src ?? this.src,
        variantIds: variantIds ?? this.variantIds,
      );

  factory ImageProduct.fromJson(Map<String, dynamic> json) => ImageProduct(
        id: json["id"],
        alt: json["alt"],
        position: json["position"],
        productId: json["product_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        adminGraphqlApiId: json["admin_graphql_api_id"],
        width: json["width"],
        height: json["height"],
        src: json["src"],
        variantIds: json["variant_ids"] == null
            ? []
            : List<dynamic>.from(json["variant_ids"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alt": alt,
        "position": position,
        "product_id": productId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "admin_graphql_api_id": adminGraphqlApiId,
        "width": width,
        "height": height,
        "src": src,
        "variant_ids": variantIds == null
            ? []
            : List<dynamic>.from(variantIds!.map((x) => x)),
      };
}

class Option {
  final int? id;
  final int? productId;
  final Name? name;
  final int? position;
  final List<String>? values;

  Option({
    this.id,
    this.productId,
    this.name,
    this.position,
    this.values,
  });

  Option copyWith({
    int? id,
    int? productId,
    Name? name,
    int? position,
    List<String>? values,
  }) =>
      Option(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        name: name ?? this.name,
        position: position ?? this.position,
        values: values ?? this.values,
      );

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        productId: json["product_id"],
        name: nameValues.map[json["name"]]!,
        position: json["position"],
        values: json["values"] == null
            ? []
            : List<String>.from(json["values"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": nameValues.reverse[name],
        "position": position,
        "values":
            values == null ? [] : List<dynamic>.from(values!.map((x) => x)),
      };
}

enum Name { TITLE }

final nameValues = EnumValues({"Title": Name.TITLE});

enum PublishedScope { WEB }

final publishedScopeValues = EnumValues({"web": PublishedScope.WEB});

class Variant {
  final int? id;
  final int? productId;
  final String? title;
  final String? price;
  final int? position;
  final InventoryPolicy? inventoryPolicy;
  final dynamic compareAtPrice;
  final String? option1;
  final dynamic option2;
  final dynamic option3;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? taxable;
  final dynamic barcode;
  final FulfillmentService? fulfillmentService;
  final int? grams;
  final dynamic inventoryManagement;
  final bool? requiresShipping;
  final String? sku;
  final double? weight;
  final WeightUnit? weightUnit;
  final int? inventoryItemId;
  final int? inventoryQuantity;
  final int? oldInventoryQuantity;
  final String? adminGraphqlApiId;
  final dynamic imageId;

  Variant({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.position,
    this.inventoryPolicy,
    this.compareAtPrice,
    this.option1,
    this.option2,
    this.option3,
    this.createdAt,
    this.updatedAt,
    this.taxable,
    this.barcode,
    this.fulfillmentService,
    this.grams,
    this.inventoryManagement,
    this.requiresShipping,
    this.sku,
    this.weight,
    this.weightUnit,
    this.inventoryItemId,
    this.inventoryQuantity,
    this.oldInventoryQuantity,
    this.adminGraphqlApiId,
    this.imageId,
  });

  Variant copyWith({
    int? id,
    int? productId,
    String? title,
    String? price,
    int? position,
    InventoryPolicy? inventoryPolicy,
    dynamic compareAtPrice,
    String? option1,
    dynamic option2,
    dynamic option3,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? taxable,
    dynamic barcode,
    FulfillmentService? fulfillmentService,
    int? grams,
    dynamic inventoryManagement,
    bool? requiresShipping,
    String? sku,
    double? weight,
    WeightUnit? weightUnit,
    int? inventoryItemId,
    int? inventoryQuantity,
    int? oldInventoryQuantity,
    String? adminGraphqlApiId,
    dynamic imageId,
  }) =>
      Variant(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        title: title ?? this.title,
        price: price ?? this.price,
        position: position ?? this.position,
        inventoryPolicy: inventoryPolicy ?? this.inventoryPolicy,
        compareAtPrice: compareAtPrice ?? this.compareAtPrice,
        option1: option1 ?? this.option1,
        option2: option2 ?? this.option2,
        option3: option3 ?? this.option3,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        taxable: taxable ?? this.taxable,
        barcode: barcode ?? this.barcode,
        fulfillmentService: fulfillmentService ?? this.fulfillmentService,
        grams: grams ?? this.grams,
        inventoryManagement: inventoryManagement ?? this.inventoryManagement,
        requiresShipping: requiresShipping ?? this.requiresShipping,
        sku: sku ?? this.sku,
        weight: weight ?? this.weight,
        weightUnit: weightUnit ?? this.weightUnit,
        inventoryItemId: inventoryItemId ?? this.inventoryItemId,
        inventoryQuantity: inventoryQuantity ?? this.inventoryQuantity,
        oldInventoryQuantity: oldInventoryQuantity ?? this.oldInventoryQuantity,
        adminGraphqlApiId: adminGraphqlApiId ?? this.adminGraphqlApiId,
        imageId: imageId ?? this.imageId,
      );

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        productId: json["product_id"],
        title: json["title"],
        price: json["price"],
        position: json["position"],
        inventoryPolicy: inventoryPolicyValues.map[json["inventory_policy"]]!,
        compareAtPrice: json["compare_at_price"],
        option1: json["option1"],
        option2: json["option2"],
        option3: json["option3"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        taxable: json["taxable"],
        barcode: json["barcode"],
        fulfillmentService:
            fulfillmentServiceValues.map[json["fulfillment_service"]]!,
        grams: json["grams"],
        inventoryManagement: json["inventory_management"],
        requiresShipping: json["requires_shipping"],
        sku: json["sku"],
        weight: json["weight"]?.toDouble(),
        weightUnit: weightUnitValues.map[json["weight_unit"]]!,
        inventoryItemId: json["inventory_item_id"],
        inventoryQuantity: json["inventory_quantity"],
        oldInventoryQuantity: json["old_inventory_quantity"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        imageId: json["image_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "title": title,
        "price": price,
        "position": position,
        "inventory_policy": inventoryPolicyValues.reverse[inventoryPolicy],
        "compare_at_price": compareAtPrice,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "taxable": taxable,
        "barcode": barcode,
        "fulfillment_service":
            fulfillmentServiceValues.reverse[fulfillmentService],
        "grams": grams,
        "inventory_management": inventoryManagement,
        "requires_shipping": requiresShipping,
        "sku": sku,
        "weight": weight,
        "weight_unit": weightUnitValues.reverse[weightUnit],
        "inventory_item_id": inventoryItemId,
        "inventory_quantity": inventoryQuantity,
        "old_inventory_quantity": oldInventoryQuantity,
        "admin_graphql_api_id": adminGraphqlApiId,
        "image_id": imageId,
      };
}

enum FulfillmentService { MANUAL }

final fulfillmentServiceValues =
    EnumValues({"manual": FulfillmentService.MANUAL});

enum InventoryPolicy { DENY }

final inventoryPolicyValues = EnumValues({"deny": InventoryPolicy.DENY});

enum WeightUnit { KG }

final weightUnitValues = EnumValues({"kg": WeightUnit.KG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
