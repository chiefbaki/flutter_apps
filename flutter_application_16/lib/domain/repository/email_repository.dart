import 'package:dio/dio.dart';
import 'package:flutter_application_16/%C2%A0core/consts/consts.dart';
import 'package:flutter_application_16/data/model/email_model.dart';

class EmailRepository {
  final Dio dio;
  EmailRepository({required this.dio});

  Future<void> sendMessage(
      {required String name,
      required String message}) async {
    final Response response = await dio.post("",
        data: EmailModel(
                serviceId: ApiConsts.serviceId,
                accessToken: ApiConsts.accessToken,
                templateId: ApiConsts.templateId,
                userId: ApiConsts.userId,
                templateParams: TemplateParams(
                    fromName: name,
                    toName: "Islam Kurbanov",
                    message: message))
            .toJson());
    print(response.data);
  }
}
