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

  String get trash => "$basePath/ic_trash.svg";

  String get gridview => "$basePath/ic_gridview.svg";

  String get gridviewSelected => "$basePath/ic_gridview_selected.svg";

  String get rowVertical => "$basePath/ic_row_vertical.svg";

  String get rowVerticalSelected => "$basePath/ic_row_vertical_selected.svg";

  String get vfx => "$basePath/ic_vfx.svg";

  String get usdt => "$basePath/ic_usdt.svg";

  String get bottomNavBar => "$basePath/ic_bottom_navbar.svg";

  String get smsNotification => "$basePath/ic_sms_notification.svg";

  String get twitterShare => "$basePath/ic_twitter_share.svg";

  String get telegramShare => "$basePath/ic_telegram_share.svg";

  String get logout => "$basePath/ic_logout.svg";

  String get token => "$basePath/ic_token.png";

  String get arrowExchange => "$basePath/ic_arrow_exchange.svg";

  String get wallet2 => "$basePath/ic_wallet2.svg";

  String get money3 => "$basePath/ic_money3.svg";

  String get receiptAdd => "$basePath/ic_receipt_add.svg";

  String get addWallet => "$basePath/ic_add_wallet.svg";

  String get addWallet2 => "$basePath/ic_wallet_add2.svg";

  String get addWallet3 => "$basePath/ic_add_wallet_3.svg";

  String get emptyWallet => "$basePath/ic_empty_wallet.svg";

  String get buySend => "$basePath/ic_buy_send.svg";

  String get merrill => "$basePath/ic_merrill.png";

  String get webull => "$basePath/ic_webull.png";

  String get zacks => "$basePath/ic_zacks.png";

  String get ally => "$basePath/ic_ally.png";

  String get tradeStation => "$basePath/ic_tradestation.png";

  String get keyBack => "$basePath/ic_key_back.svg";

  String get website => "$basePath/ic_website.svg";

  String get repeat => "$basePath/ic_repeat.svg";

  String get message => "$basePath/ic_message.svg";

  String get send => "$basePath/ic_send.svg";

  String get miniChart => "$basePath/ic_mini_chart.svg";

  String get miniVChart => "$basePath/ic_mini_vchart.svg";

  String get moneySend => "$basePath/ic_money_send.svg";

  String get money => "$basePath/ic_money.svg";

  String get document2 => "$basePath/ic_document.svg";

  String get done => "$basePath/ic_done.svg";

  String get cancel => "$basePath/ic_cancel.svg";

  String get refresh => "$basePath/ic_refresh.svg";

  String get filter2 => "$basePath/ic_filter2.svg";

  String get heartColored => "$basePath/ic_heart_colored.svg";

  String get like => "$basePath/ic_like.svg";

  String get liked => "$basePath/ic_liked.svg";

  String get dislike => "$basePath/ic_dislike.svg";

  String get disliked => "$basePath/ic_disliked.svg";

  String get welcomeArrow => "$basePath/ic_welcome_arrow.svg";

  String get addUser => "$basePath/ic_user_add.svg";

  String get crown => "$basePath/ic_crown.svg";

  String get heart => "$basePath/ic_heart.svg";

  String get likedHeart => "$basePath/ic_liked_heart.svg";

  String get notification => "$basePath/ic_notification.svg";

  String get notificationColored => "$basePath/ic_notif_colored.svg";

  String get tsl => "$basePath/ic_tsl.svg";

  String get tesla => "$basePath/ic_tesla.png";

  String get back => "$basePath/ic_back.svg";

  // #settings icons

  String get settings => "$basePath/settings_icons/ic_settings.svg";

  String get sessions => "$basePath/settings_icons/ic_sessions.svg";

  String get lockSlash => "$basePath/settings_icons/ic_lock_slash.svg";

  String get coin => "$basePath/settings_icons/ic_coin.svg";

  String get document => "$basePath/settings_icons/ic_document.svg";

  String get facebook => "$basePath/settings_icons/ic_facebook.svg";

  String get changePassword => "$basePath/settings_icons/ic_change_password.svg";

  String get userEdit => "$basePath/settings_icons/ic_user_edit.svg";

  String get lock => "$basePath/settings_icons/ic_lock.svg";

  String get bingNotif => "$basePath/settings_icons/ic_notif_bing.svg";

  String get statusNotif => "$basePath/settings_icons/ic_notif_status.svg";

  String get preference => "$basePath/settings_icons/ic_preference.svg";

  String get reddit => "$basePath/settings_icons/ic_reddit.svg";

  String get telegram => "$basePath/settings_icons/ic_telegram.svg";

  String get twitter => "$basePath/settings_icons/ic_twitter.svg";

  String get wallet => "$basePath/settings_icons/ic_wallet.svg";

  String get profile => "$basePath/settings_icons/ic_profile.svg";

  // #navigation bar icons

  String get fab => "$basePath/navigation_bar_icons/ic_fab.svg";

  String get star => "$basePath/navigation_bar_icons/ic_star.svg";

  String get starChosen => "$basePath/navigation_bar_icons/ic_star_chosen.svg";

  String get home => "$basePath/navigation_bar_icons/ic_home.svg";

  String get homeChosen => "$basePath/navigation_bar_icons/ic_home_chosen.svg";

  String get homeWallet => "$basePath/navigation_bar_icons/ic_wallet.svg";

  String get homeWalletChosen => "$basePath/navigation_bar_icons/ic_wallet_chosen.svg";

  String get bitcoinConvert => "$basePath/navigation_bar_icons/ic_bitcoin_convert.svg";

  String get bitcoinConvertChosen => "$basePath/navigation_bar_icons/ic_bitcoin_convert_chosen.svg";

  String get graph => "$basePath/navigation_bar_icons/ic_graph.svg";

  String get graphChosen => "$basePath/navigation_bar_icons/ic_graph_chosen.png";

  String get search => "$basePath/ic_search.svg";

  String get add => "$basePath/ic_add.svg";

  String get btcConvert => "$basePath/ic_btc_convert.svg";

  String get btc => "$basePath/ic_btc.svg";

  String get bitcoin => "$basePath/ic_bitcoin.png";

  String get solano => "$basePath/ic_solano.png";

  String get tesla2 => "$basePath/ic_tesla2.png";

  String get charts => "$basePath/ic_charts.svg";

  String get homeS => "$basePath/ic_home.svg";

  String get onramper => "$basePath/ic_onramper.svg";

  String get stocks => "$basePath/ic_stocks.svg";

  String get walletS => "$basePath/ic_wallet.svg";

  String get logoSyfter => "$basePath/logo_syfter.svg";

  String get sort => "$basePath/ic_sort.svg";

  String get settingS => "$basePath/ic_settings.svg";

  String get remove => "$basePath/ic_remove.svg";

  String get arrowRight => "$basePath/arrow_right.svg";

  String get arrowUp => "$basePath/ic_arrow_up.svg";

  String get arrowLeftDown => "$basePath/ic_arrow_left_down.svg";

  String get arrowDown => "$basePath/ic_arrow_down.svg";

  String get arrowLeft => "$basePath/ic_arrow_left.svg";

  String get settings2 => "$basePath/settings.svg";

  String get filter => "$basePath/ic_filter.svg";

  String get logoTesla => "$basePath/logo_tesla.svg";

  String get logoTwitter => "$basePath/logo_twitter.svg";

  String get favorite => "$basePath/ic_start.svg";

  String get eth => "$basePath/ic_eth.svg";

  String get sol => "$basePath/ic_sol.svg";

  String get delete => "$basePath/ic_delete.svg";

  String get warning => "$basePath/ic_warning.svg";

  String get check => "$basePath/ic_check.svg";

  String get skiped => "$basePath/ic_skiped.svg";

  String get fillNoticication => "$basePath/ic_fill_notific.svg";

  String get trendUp => "$basePath/trend_up.svg";

  String get btcConvertFill => "$basePath/ic_btc_convert_fill.svg";

  String get earned => "$basePath/ic_earned.svg";

  String get apple => "$basePath/ic_apple.png";

  String get fell => "$basePath/ic_fell.svg";

  String get subscCrown => "$basePath/subsc_crown.svg";

  String get logoSyfterColored => "$basePath/logo_syfter_colored.png";

  String get pencilFlag => "$basePath/pencil_flag.svg";

  String get cancelFill => "$basePath/cancel_fill.svg";

  String get convert => "$basePath/ic_convert.svg";

  String get clock => "$basePath/ic_clock.svg";
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  // String get start25 => "$basePath/start_25.png";

  // String get start50 => "$basePath/start_50.png";

  // String get start100 => "$basePath/start_100.png";

  String get inviteFriend => "$basePath/invite_friend.png";

  String get fox => "$basePath/fox.png";

  String get walletConnect => "$basePath/wallet_connect.png";

  String get welcome => "$basePath/im_welcome.png";

  String get inviteBg => "$basePath/invite_bg.png";

  String get teslaNews => "$basePath/im_news_tesla.png";

  String get teslaNewsLarge => "$basePath/tesla_news_large.png";

  String get person1 => "$basePath/person1.png";

  String get person2 => "$basePath/person2.png";

  String get person3 => "$basePath/person3.png";

  String get bgCart => "$basePath/bg_cart2.png";

  String get cartBottom => "$basePath/cart_bottom.png";

  String get diagramma => "$basePath/diagramma.png";

  String get diagramma2 => "$basePath/diagramma2.png";

  String get ellipse => "$basePath/ic_ellipse.png";

  String get signInBg => "$basePath/sign_in_bg_png.png";

  String get flagUs => "$basePath/flag_us.png";

  String get bgCircle => "$basePath/bg_circle.png";

  String get imgCards => "$basePath/img_cards.png";

  String get bgImgSwipeCartUp => "$basePath/bg_img_swipe_cart_up.png";

  String get bgImgSwipeCartDown => "$basePath/bg_img_swipe_cart_down.png";

  String get bgSubscripotion => "$basePath/bg_subsctip.png";
}

class _Videos extends _AssetsHolder {
  const _Videos() : super('assets/videos');
  String get intro => "$basePath/intro_video.mp4";
  String get intro1 => "$basePath/intro_1.mp4";
  String get intro2 => "$basePath/intro_2.mp4";
  String get intro3 => "$basePath/intro_3.mp4";
  String get intro4 => "$basePath/intro_4.mp4";
}
