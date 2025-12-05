import 'package:flutter_project/models/conversion_rate.dart';

class ExchangeRate {
  String? result;
  String? documentation;
  String? termsOfUse;
  int? timeLastUpdateUnix;
  String? timeLastUpdateUtc;
  int? timeNextUpdateUnix;
  String? timeNextUpdateUtc;
  String? baseCode;
  ConversionRates? conversionRates;

  ExchangeRate(
      {this.result,
        this.documentation,
        this.termsOfUse,
        this.timeLastUpdateUnix,
        this.timeLastUpdateUtc,
        this.timeNextUpdateUnix,
        this.timeNextUpdateUtc,
        this.baseCode,
        this.conversionRates});

  ExchangeRate.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    documentation = json['documentation'];
    termsOfUse = json['terms_of_use'];
    timeLastUpdateUnix = json['time_last_update_unix'];
    timeLastUpdateUtc = json['time_last_update_utc'];
    timeNextUpdateUnix = json['time_next_update_unix'];
    timeNextUpdateUtc = json['time_next_update_utc'];
    baseCode = json['base_code'];
    conversionRates = json['conversion_rates'] != null
        ? new ConversionRates.fromJson(json['conversion_rates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['documentation'] = this.documentation;
    data['terms_of_use'] = this.termsOfUse;
    data['time_last_update_unix'] = this.timeLastUpdateUnix;
    data['time_last_update_utc'] = this.timeLastUpdateUtc;
    data['time_next_update_unix'] = this.timeNextUpdateUnix;
    data['time_next_update_utc'] = this.timeNextUpdateUtc;
    data['base_code'] = this.baseCode;
    if (this.conversionRates != null) {
      data['conversion_rates'] = this.conversionRates!.toJson();
    }
    return data;
  }
}
