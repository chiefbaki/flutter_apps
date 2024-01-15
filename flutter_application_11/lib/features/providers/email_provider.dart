import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/consts/api_consts.dart';
import 'package:flutter_application_11/data/model/email_model/email_model.dart';
import 'package:flutter_application_11/data/model/product_model/product_model.dart';
import 'package:flutter_application_11/repository/network_settings/network_settings.dart';

class EmailProvider extends ChangeNotifier {
  final Dio dio = DioSettings().dio;
  Future<void> sendEmail(List<ProductModel> product, double sum) async {
    List<String> name = [];
    List<String> model = [];
    List<String> price = [];
    List<int> quantity = [];
    for (var el in product) {
      name.add(el.name);
      model.add(el.model);
      price.add(el.price);
      quantity.add(el.quantity);
    }
    await dio.post("https://api.emailjs.com/api/v1.0/email/send?",
        data: EmailModel(
                templateId: ApiConsts.templateId,
                serviceId: ApiConsts.serviceId,
                userId: ApiConsts.userId,
                accessToken: ApiConsts.accessToken,
                templateParams: TemplateParams(
                    fromName: "Discover Shop team",
                    toName: "Buyer",
                    message:
                        "Name: ${name.map((e) => e)}\nModel: ${model.map((e) => e)}\nPrice: ${price.map((e) => e)}\nQuantity:${quantity.map((e) => e)}\nSum: $sum"))
            .toJson());
  }
}
