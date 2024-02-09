import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/consts/api_consts.dart';
import 'package:flutter_application_11/data/model/email_model/email_model.dart';
import 'package:flutter_application_11/data/model/product_model/product_model.dart';
import 'package:flutter_application_11/repository/network_settings/network_settings.dart';

class EmailProvider extends ChangeNotifier {
  final Dio _dio = DioSettings().dio;
  final List<String> _name = [];
  final List<String> _model = [];
  final List<String> _price = [];
  final List<int> _quantity = [];
  
  Future<void> sendEmail(List<ProductModel> product, double sum) async {
    for (var el in product) {
      _name.add(el.name);
      _model.add(el.model);
      _price.add(el.price);
      _quantity.add(el.quantity);
    }
    await _dio.post("https://api.emailjs.com/api/v1.0/email/send?",
        data: EmailModel(
                templateId: ApiConsts.templateId,
                serviceId: ApiConsts.serviceId,
                userId: ApiConsts.userId,
                accessToken: ApiConsts.accessToken,
                templateParams: TemplateParams(
                    fromName: "Discover Shop team",
                    toName: "Buyer",
                    message:
                        "Name: ${_name.map((e) => e)}\nModel: ${_model.map((e) => e)}\nPrice: ${_price.map((e) => e)}\nQuantity:${_quantity.map((e) => e)}\nSum: $sum"))
            .toJson());
  }
}
