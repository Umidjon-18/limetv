import 'assets.dart';
 bool comedy = false;
  bool drama = false;
  bool melodrama = false;
  bool ujas = false;
  bool triller = false;
  bool kriminal = false;
  bool fantastik = false;
  bool boevik = false;
  bool detektiv = false;
  bool anime = false;
  bool multfilm = false;
  bool priklyucjenye = false;
  bool fentezi = false;
  bool history = false;
  bool family = false;
  bool biography = false;
  bool mistics = false;
    List janrBools = [
    comedy,
    drama,
    melodrama,
    ujas,
    triller,
    kriminal,
    fantastik,
    boevik,
    detektiv,
    anime,
    multfilm,
    priklyucjenye,
    fentezi,
    history,
    family,
    biography,
    mistics,
  ];


  bool russian = false;
  bool english = false;
  List languagesList = ['Русский', 'Английский'];
   List languageBools = [russian, english];



const List<String> settingsMenuName = [
  'Основные',
  'Оплата услуг',
  'Мои утсройства',
  'Защита от детей',
  'Жалобы и предложения',
  'Уведомление',
  'Выход',
];

List<String> settingIconText = [
  Assets.icons.settingsMain,
  Assets.icons.paymentServices,
  Assets.icons.myDevices,
  Assets.icons.securityChilds,
  Assets.icons.complaintsSuggestions,
  Assets.icons.notifications,
  Assets.icons.exit,
];

const List<String> settingsTextFieldTexts = ['Эл. адрес', 'Имя аккаунта', 'Телефон номер'];
