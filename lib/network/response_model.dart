class Pagemap {
  List<Imageobject>? imageobject;
  List<CseImage>? cseImage;

  Pagemap({
    this.imageobject,
    this.cseImage,
  });

  Pagemap.fromJson(Map<String, dynamic> json) {
    if (json['imageobject'] != null) {
      imageobject = <Imageobject>[];
      json['imageobject'].forEach((v) {
        imageobject!.add(new Imageobject.fromJson(v));
      });
    }
    if (json['cse_image'] != null) {
      cseImage = <CseImage>[];
      json['cse_image'].forEach((v) {
        cseImage!.add(new CseImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.imageobject != null) {
      data['imageobject'] = this.imageobject!.map((v) => v.toJson()).toList();
    }
    if (this.cseImage != null) {
      data['cse_image'] = this.cseImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CseImage {
  String? src;

  CseImage({this.src});

  CseImage.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = this.src;
    return data;
  }
}

class Imageobject {
  String? contenturl;

  Imageobject({this.contenturl});

  Imageobject.fromJson(Map<String, dynamic> json) {
    contenturl = json['contenturl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contenturl'] = this.contenturl;
    return data;
  }
}
