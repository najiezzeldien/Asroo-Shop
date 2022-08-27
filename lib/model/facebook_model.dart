// ignore_for_file: public_member_api_docs, sort_constructors_first
// {
//  "name": "Open Graph Test User",
//  "email": "open_jygexjs_user@tfbnw.net",
//  "picture": {
//    "data": {
//      "height": 126,
//      "url": "https://scontent.fuio21-1.fna.fbcdn.net/v/t1.30497-1/s200x200/84628273_176159830277856_972693363922829312_n.jpg",
//      "width": 200
//    }
//  },
//  "id": "136742241592917"
// }
class FacebookModel {
  final String? name;
  final String? email;
  final String? id;
  final FacebookPhotoModel? facebookPhotoModel;
  FacebookModel({
    this.name,
    this.email,
    this.id,
    this.facebookPhotoModel,
  });
  factory FacebookModel.fromJson(Map<String, dynamic> json) => FacebookModel(
        email: json['email'],
        name: json['name'],
        id: json['id'],
        facebookPhotoModel: FacebookPhotoModel.fromJson(
            Map<String, dynamic>.from(json['picture']['data'])),
      );
}

class FacebookPhotoModel {
  final String? url;
  final int? height;
  final int? width;
  FacebookPhotoModel({
    this.url,
    this.height,
    this.width,
  });
  factory FacebookPhotoModel.fromJson(Map<String, dynamic> json) =>
      FacebookPhotoModel(
        url: json['url'],
        width: json['width'],
        height: json['height'],
      );
}
