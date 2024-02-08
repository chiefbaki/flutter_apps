class EmailModel {
  String? serviceId;
  String? templateId;
  String? userId;
  String? accessToken;
  TemplateParams? templateParams;

  EmailModel(
      {this.serviceId,
      this.templateId,
      this.userId,
      this.accessToken,
      this.templateParams});

  EmailModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    templateId = json['template_id'];
    userId = json['user_id'];
    accessToken = json['accessToken'];
    templateParams = json['template_params'] != null
        ? new TemplateParams.fromJson(json['template_params'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['template_id'] = this.templateId;
    data['user_id'] = this.userId;
    data['accessToken'] = this.accessToken;
    if (this.templateParams != null) {
      data['template_params'] = this.templateParams!.toJson();
    }
    return data;
  }
}

class TemplateParams {
  String? fromName;
  String? toName;
  String? message;

  TemplateParams({this.fromName, this.toName, this.message});

  TemplateParams.fromJson(Map<String, dynamic> json) {
    fromName = json['from_name'];
    toName = json['to_name'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_name'] = this.fromName;
    data['to_name'] = this.toName;
    data['message'] = this.message;
    return data;
  }
}