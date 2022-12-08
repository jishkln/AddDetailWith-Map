class AddResponce {
  AddResponce({
    this.adDetail,
    this.ownerDetails,
  });

  AdDetail? adDetail;
  OwnerDetails? ownerDetails;

  factory AddResponce.fromJson(Map<String, dynamic> json) => AddResponce(
        adDetail: AdDetail.fromJson(json["AdDetail"]),
        ownerDetails: OwnerDetails.fromJson(json["ownerDetails"]),
      );
}

class AdDetail {
  AdDetail({
    this.category,
    this.subCategory,
    this.description,
    this.imageUrl,
    this.adPostedAddress,
    this.adStatus,
    this.adType,
    this.createdAt,
    this.price,
  });

  String? category;
  String? subCategory;
  String? description;
  List<String>? imageUrl;
  String? adPostedAddress;
  String? adStatus;
  String? adType;
  DateTime? createdAt;
  int? price;

  factory AdDetail.fromJson(Map<String, dynamic> json) => AdDetail(
        category: json["category"],
        subCategory: json["sub_category"],
        description: json["description"],
        imageUrl: List<String>.from(json["image_url"].map((x) => x)),
        adPostedAddress: json["ad_posted_address"],
        adStatus: json["ad_status"],
        adType: json["ad_type"],
        createdAt: DateTime.parse(json["created_at"]),
        price: json["price"],
      );
}

class OwnerDetails {
  OwnerDetails({
    this.name,
    this.createdDate,
    this.profileUrl,
  });

  String? name;
  DateTime? createdDate;
  String? profileUrl;

  factory OwnerDetails.fromJson(Map<String, dynamic> json) => OwnerDetails(
        name: json["name"],
        createdDate: DateTime.parse(json["created_date"]),
        profileUrl: json["profile_url"],
      );
}
