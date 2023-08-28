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
  "0703",
  "0706",
  "0803",
  "0903",
  "0906",
  "0913",
  "0916",
  "0704"
];
List<String> AirtelNet = [
  "0701",
  "0708",
  "0812",
  "0802",
  "0808",
  "0902",
  "0901",
  "0904",
  "0907",
  "0912"
];
List<String> GloNet = [
  "0815",
  "0811",
  "0805",
  "0807",
  "0705",
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
