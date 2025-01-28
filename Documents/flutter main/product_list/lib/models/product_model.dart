// ignore_for_file: constant_identifier_names

class ProductModel {
    final int? id;
    final String? title;
    final double? price;
    final String? description;
    final Category? category;
    final String? image;
    final Rating? rating;

    ProductModel({
        this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating,
    });

    ProductModel copyWith({
        int? id,
        String? title,
        double? price,
        String? description,
        Category? category,
        String? image,
        Rating? rating,
    }) => 
        ProductModel(
            id: id ?? this.id,
            title: title ?? this.title,
            price: price ?? this.price,
            description: description ?? this.description,
            category: category ?? this.category,
            image: image ?? this.image,
            rating: rating ?? this.rating,
        );
}

 enum Category {

    ELECTRONICS,
    JEWELERY,
    MEN_S_CLOTHING,
    WOMEN_S_CLOTHING
}

class Rating {
    final double? rate;
    final int? count;

    Rating({
        this.rate,
        this.count,
    });

    Rating copyWith({
        double? rate,
        int? count,
    }) => 
        Rating(
            rate: rate ?? this.rate,
            count: count ?? this.count,
        );
}
