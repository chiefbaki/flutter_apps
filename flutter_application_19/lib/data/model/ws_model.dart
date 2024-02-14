class CryptoGraphic {
  String? typeTrade;
  num? eventTimesTamp;
  String? name;
  int? id;
  String? priceOfDeal;
  String? numberOfAssets;
  int? idOfBuyer;
  int? idOfSeller;
  int? tradeTime;
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
      this.tradeTime,
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
    tradeTime = json["T"];
    isCreator = json["m"];
    isOrder = json["M"];
  }
}
