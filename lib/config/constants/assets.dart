abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();

  // ignore: library_private_types_in_public_api
  static _ChannelsList get channelList => _ChannelsList();

  // ignore: library_private_types_in_public_api
  static _Videos get videos => const _Videos();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get trash => "$basePath/ic_trash.svg";
  String get search => "$basePath/search_1.png";
  String get play => "$basePath/play.svg";
  String get clock => "$basePath/clock.svg";
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get yoshlarTv => "$basePath/yoshlar_tv.png";
  String get dunyoBoylab => "$basePath/dunyo_boylab.png";
  String get mahalla => "$basePath/mahalla_channel.png";
  String get my5 => "$basePath/my5.png";
  String get navo => "$basePath/navo.png";
  String get sevimli => "$basePath/sevimli_channel.png";
  
  String get channelPlay => "$basePath/channel_play.png";

  String get euroPlus => "$basePath/euro_plus.png";
  String get kinopremyera => "$basePath/kinopremyera.png";
  String get match => "$basePath/match.png";
  String get rossiya1 => "$basePath/rossiya_1.png";
  String get tht => "$basePath/tht.png";
  String get onePlusOne => "$basePath/1plus1.png";

  String get appStore => "$basePath/app_store.svg";
  String get playMarket => "$basePath/google_play.svg";
  String get telegram => "$basePath/telegram.svg";
  String get youTube => "$basePath/you_tube.svg";
  String get instagram => "$basePath/instagram.svg";
}

class _ChannelsList {
  List<String> russianChannels = [
    const _Images().tht,
    const _Images().rossiya1,
    const _Images().match,
    const _Images().onePlusOne,
    const _Images().kinopremyera,
    const _Images().euroPlus,
    const _Images().onePlusOne,
    const _Images().euroPlus,
    const _Images().kinopremyera,
    const _Images().rossiya1,
    const _Images().tht,
    const _Images().match,
  ];

  List<String> uzbekChannels = [
    const _Images().yoshlarTv,
    const _Images().sevimli,
    const _Images().navo,
    const _Images().dunyoBoylab,
    const _Images().mahalla,
    const _Images().my5,
    const _Images().mahalla,
    const _Images().dunyoBoylab,
    const _Images().my5,
    const _Images().yoshlarTv,
    const _Images().sevimli,
    const _Images().navo,
  ];
}

class _Videos extends _AssetsHolder {
  const _Videos() : super('assets/videos');
}
