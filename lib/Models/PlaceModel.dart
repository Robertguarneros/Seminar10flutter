class Place {
  final String id;
  final String title;
  final String content;
  final String photo;
  final String author;
  final int rating;
  final String address;
  final bool place_deactivated;
  final String creation_date;
  final String modified_date;

  Place({
    required this.id,
    required this.title,
    required this.content,
    required this.photo,
    required this.author,
    required this.rating,
    required this.address,
    required this.place_deactivated,
    required this.creation_date,
    required this.modified_date,
  });

  // Convert Place object to a Map<String, dynamic> for JSON encoding
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'content': content,
      'photo': photo,
      'author': author,
      'rating': rating,
      'address': address,
      'place_deactivated': place_deactivated,
      'creation_date': creation_date,
      'modified_date': modified_date,
    };
  }

  // Factory constructor to create a Place object from a JSON map
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      photo: json['photo'],
      author: json['author'],
      rating: json['rating'],
      address: json['address'],
      place_deactivated: json['place_deactivated'],
      creation_date: json['creation_date'],
      modified_date: json['modified_date'],
    );
  }
}
