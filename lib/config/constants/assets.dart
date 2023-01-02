abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();

  // ignore: library_private_types_in_public_api
  static _Videos get videos => const _Videos();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get favorite => "$basePath/ic_favorite.svg";

  String get filter => "$basePath/ic_filter.svg";

  String get home => "$basePath/ic_home.svg";

  String get search => "$basePath/ic_search.svg";

  String get tv => "$basePath/ic_tv.svg";

  String get arrowRight => "$basePath/ic_arrow_right.svg";

  String get cancel => "$basePath/ic_cancel.svg";

  String get documentary => "$basePath/documentary.svg";

  String get action => "$basePath/action.svg";

  String get filmNoir => "$basePath/film_noir.svg";

  String get drama => "$basePath/drama.svg";

  String get comedy => "$basePath/comedy.svg";

  String get crime => "$basePath/crime.svg";

  String get romantic => "$basePath/romantic_movies.svg";

  String get musical => "$basePath/musical.svg";

  String get sport => "$basePath/sport.svg";

  String get fantasy => "$basePath/fantasy.svg";

  String get horror => "$basePath/horror.svg";

  String get thriller => "$basePath/thriller.svg";


}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get logo => "$basePath/logo.svg";

  String get banner1 => "$basePath/banner_1.png";

  String get kingman => "$basePath/kingman.png";

  String get assasin => "$basePath/assasin.png";
  
  String get love => "$basePath/love.png";
  
  String get ripd => "$basePath/ripd.png";

  String get after => "$basePath/after.png";

  String get aladdin => "$basePath/aladdin.png";

  String get avatar => "$basePath/avatar.png";
  
  String get bigAndSmall => "$basePath/big_and_small.png";

  String get blade => "$basePath/blade.png";

  String get breakingBad => "$basePath/breaking_bad.png";

  String get christmasChronicles => "$basePath/christmas_chronicles.png";

  String get christmasVacation => "$basePath/christmas_vacation.png";

  String get christmas => "$basePath/christmas.png";

  String get deathCar => "$basePath/death_car.png";

  String get fantasticFour => "$basePath/fantastic_four.png";

  String get frontCover => "$basePath/front_cover.png";

  String get frozen => "$basePath/frozen.png";

  String get gothamKnights => "$basePath/gotham_knights.png";

  String get inception => "$basePath/inception.png";

  String get indianaJones => "$basePath/indiana_jones.png";

  String get lastChristmas => "$basePath/last_christmas.png";

  String get london => "$basePath/london.png";

  String get mandalorian => "$basePath/mandalorian.png";

  String get mermaidCartoon => "$basePath/mermaid_cartoon.png";

  String get mermaid => "$basePath/mermaid.png";

  String get moana => "$basePath/moana.png";

  String get princePersea => "$basePath/prince_persea.png";

  String get princePerseaBg => "$basePath/prince_persea_bg.png";

  String get sing => "$basePath/sing.png";

  String get titanic => "$basePath/titanic.png";

  String get titanic2 => "$basePath/titanic2.png";

  String get xmen => "$basePath/xmen.png";


}

class _Videos extends _AssetsHolder {
  const _Videos() : super('assets/videos');
}
