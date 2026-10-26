/// Response models for the Color Name Finder API.

/// API Response wrapper.
class ColornamefinderResponse {
  final String status;
  final dynamic error;
  final ColornamefinderData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  ColornamefinderResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory ColornamefinderResponse.fromJson(Map<String, dynamic> json) => ColornamefinderResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? ColornamefinderData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Color Name Finder API.

class ColornamefinderData {
  String? inputHex;
  ColornamefinderDataInputRgb? inputRgb;
  bool? exactMatch;
  ColornamefinderDataClosestColor? closestColor;
  List<ColornamefinderDataClosestMatchesItem>? closestMatches;
  num? totalNamedColors;

  ColornamefinderData({
    this.inputHex,
    this.inputRgb,
    this.exactMatch,
    this.closestColor,
    this.closestMatches,
    this.totalNamedColors,
  });

  factory ColornamefinderData.fromJson(Map<String, dynamic> json) => ColornamefinderData(
      inputHex: json['input_hex'],
      inputRgb: json['input_rgb'] != null ? ColornamefinderDataInputRgb.fromJson(json['input_rgb']) : null,
      exactMatch: json['exact_match'],
      closestColor: json['closest_color'] != null ? ColornamefinderDataClosestColor.fromJson(json['closest_color']) : null,
      closestMatches: (json['closest_matches'] as List?)?.map((e) => ColornamefinderDataClosestMatchesItem.fromJson(e)).toList(),
      totalNamedColors: json['total_named_colors'],
    );
}

class ColornamefinderDataInputRgb {
  num? r;
  num? g;
  num? b;

  ColornamefinderDataInputRgb({
    this.r,
    this.g,
    this.b,
  });

  factory ColornamefinderDataInputRgb.fromJson(Map<String, dynamic> json) => ColornamefinderDataInputRgb(
      r: json['r'],
      g: json['g'],
      b: json['b'],
    );
}

class ColornamefinderDataClosestColor {
  String? name;
  String? hex;
  num? distance;
  num? similarity;
  ColornamefinderDataClosestColorRgb? rgb;

  ColornamefinderDataClosestColor({
    this.name,
    this.hex,
    this.distance,
    this.similarity,
    this.rgb,
  });

  factory ColornamefinderDataClosestColor.fromJson(Map<String, dynamic> json) => ColornamefinderDataClosestColor(
      name: json['name'],
      hex: json['hex'],
      distance: json['distance'],
      similarity: json['similarity'],
      rgb: json['rgb'] != null ? ColornamefinderDataClosestColorRgb.fromJson(json['rgb']) : null,
    );
}

class ColornamefinderDataClosestColorRgb {
  num? r;
  num? g;
  num? b;

  ColornamefinderDataClosestColorRgb({
    this.r,
    this.g,
    this.b,
  });

  factory ColornamefinderDataClosestColorRgb.fromJson(Map<String, dynamic> json) => ColornamefinderDataClosestColorRgb(
      r: json['r'],
      g: json['g'],
      b: json['b'],
    );
}

class ColornamefinderDataClosestMatchesItem {
  String? name;
  String? hex;
  num? distance;
  num? similarity;
  ColornamefinderDataClosestMatchesItemRgb? rgb;

  ColornamefinderDataClosestMatchesItem({
    this.name,
    this.hex,
    this.distance,
    this.similarity,
    this.rgb,
  });

  factory ColornamefinderDataClosestMatchesItem.fromJson(Map<String, dynamic> json) => ColornamefinderDataClosestMatchesItem(
      name: json['name'],
      hex: json['hex'],
      distance: json['distance'],
      similarity: json['similarity'],
      rgb: json['rgb'] != null ? ColornamefinderDataClosestMatchesItemRgb.fromJson(json['rgb']) : null,
    );
}

class ColornamefinderDataClosestMatchesItemRgb {
  num? r;
  num? g;
  num? b;

  ColornamefinderDataClosestMatchesItemRgb({
    this.r,
    this.g,
    this.b,
  });

  factory ColornamefinderDataClosestMatchesItemRgb.fromJson(Map<String, dynamic> json) => ColornamefinderDataClosestMatchesItemRgb(
      r: json['r'],
      g: json['g'],
      b: json['b'],
    );
}

class ColornamefinderRequest {
  String hex;
  int? closest;

  ColornamefinderRequest({
    required this.hex,
    this.closest,
  });

  Map<String, dynamic> toJson() => {
      'hex': hex,
      if (closest != null) 'closest': closest,
    };
}
