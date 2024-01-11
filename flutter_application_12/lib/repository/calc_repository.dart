class CalcRepository {
  double sum({required String a, required String b}) {
    double res = double.parse(a) + double.parse(b);
    return res;
  }

  double differences({required String a, required String b}) {
    double res = double.parse(a) - double.parse(b);
    return res;
  }
}
