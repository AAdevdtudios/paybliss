class DropIcon {
  final String name;
  final String icon;
  final int itemNo;

  DropIcon({
    required this.name,
    required this.icon,
    required this.itemNo,
  });
}

List<String> MtnNet = [
  "0803",
  "0806",
  "0703",
  "0706",
  "0813",
  "0816",
  "0810",
  "0814",
  "0903",
  "0906",
  "0913",
  "0916",
  "07025",
  "07026",
  "0704"
];
List<String> AirtelNet = [
  "0802",
  "0808",
  "0708",
  "0812",
  "0701",
  "0902",
  "0901",
  "0904",
  "0907",
  "0912"
];
List<String> GloNet = [
  "0805",
  "0807",
  "0705",
  "0815",
  "0811",
  "0905",
  "0915",
];
List<String> EtiNet = [
  "0809",
  "0818",
  "0817",
  "0909",
  "0908",
];

List<String> quick_pick = [
  "50",
  "100",
  "200",
  "500",
  "1000",
  "2000",
];

class RowItems {
  final String name;
  final String image;
  final String description;

  RowItems(
      {required this.name, required this.image, required this.description});
}
