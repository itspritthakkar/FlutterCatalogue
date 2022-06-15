class CatalogModel {
  static List<Item>? items;
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  String? image;
  bool isLiked;

//<editor-fold desc="Data Methods">

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
    required this.isLiked
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          desc == other.desc &&
          price == other.price &&
          color == other.color &&
          image == other.image &&
          isLiked == other.isLiked);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      color.hashCode ^
      image.hashCode ^
      isLiked.hashCode;

  @override
  String toString() {
    return 'Item{' +
        ' id: $id,' +
        ' name: $name,' +
        ' desc: $desc,' +
        ' price: $price,' +
        ' color: $color,' +
        ' image: $image,' +
        ' image: $isLiked,' +
        '}';
  }

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
    bool? isLiked,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
      'isLiked': isLiked,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      image: map['image'] as dynamic,
      isLiked: map['isLiked'] as bool,
    );
  }

//</editor-fold>
}