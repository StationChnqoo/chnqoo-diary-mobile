class BingWallPaper {
  String date;
  String headline;
  String title;
  String description;
  String image_url;
  String main_text;


  BingWallPaper(
      {required this.date,
      required this.headline,
      required this.title,
      required this.description,
      required this.image_url,
      required this.main_text});

  BingWallPaper.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        headline = json['headline'],
        title = json['title'],
        description = json['description'],
        image_url = json['image_url'],
        main_text = json['main_text'];

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'headline': headline,
      'title': title,
      'description': description,
      'image_url': image_url,
      'main_text': main_text,
    };
  }
}