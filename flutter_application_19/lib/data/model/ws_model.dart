// {
//     "e": "trade",
//     "E": 1707822837816,
//     "s": "ETHEUR",
//     "t": 92368238,
//     "p": "2476.49000000",
//     "q": "0.10450000",
//     "b": 2639575295,
//     "a": 2639575281,
//     "T": 1707822837814,
//     "m": false,
//     "M": true
// }

class CryptoGraphic {
  String? typeTrade;
  num? eventTimesTamp;
  String? name;
  int? id;
  String? priceOfDeal;
  String? numberOfAssets;
  int? idOfBuyer;
  int? idOfSeller;
  int? transactionTimesTamp;
  bool? isCreator;
  bool? isOrder;

  CryptoGraphic(
      this.eventTimesTamp,
      this.id,
      this.idOfBuyer,
      this.idOfSeller,
      this.isCreator,
      this.isOrder,
      this.name,
      this.numberOfAssets,
      this.priceOfDeal,
      this.transactionTimesTamp,
      this.typeTrade);

  CryptoGraphic.fromJson(Map<String, dynamic> json) {
    typeTrade = json["e"];
    eventTimesTamp = json["E"];
    name = json["s"];
    id = json["t"];
    priceOfDeal = json["p"];
    numberOfAssets = json["q"];
    idOfBuyer = json["b"];
    idOfSeller = json["a"];
    transactionTimesTamp = json["T"];
    isCreator = json["m"];
    isOrder = json["M"];
  }
}
