class MovieModel {
  String? title;
  String? year;
  String? rated;
  String? runtime;
  String? genre;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;

  String? boxOffice;

  MovieModel({
    this.title,
    this.year,
    this.runtime,
    this.genre,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.boxOffice,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    rated = json['Rated'];

    runtime = json['Runtime'];
    genre = json['Genre'];

    plot = json['Plot'];
    language = json['Language'];
    country = json['Country'];
    awards = json['Awards'];
    poster = json['Poster'];

    boxOffice = json['BoxOffice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['Rated'] = this.rated;

    data['Runtime'] = this.runtime;
    data['Genre'] = this.genre;

    data['Plot'] = this.plot;
    data['Language'] = this.language;
    data['Country'] = this.country;
    data['Awards'] = this.awards;
    data['Poster'] = this.poster;

    data['BoxOffice'] = this.boxOffice;
    return data;
  }
}

class Ratings {
  String? source;
  String? value;

  Ratings({this.source, this.value});

  Ratings.fromJson(Map<String, dynamic> json) {
    source = json['Source'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Source'] = this.source;
    data['Value'] = this.value;
    return data;
  }
}
