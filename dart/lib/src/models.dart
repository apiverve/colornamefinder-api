/// Response models for the Color Name Finder API.

/// API Response wrapper.
class ColornamefinderResponse {
  final String status;
  final dynamic error;
  final ColornamefinderData? data;

  ColornamefinderResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory ColornamefinderResponse.fromJson(Map<String, dynamic> json) => ColornamefinderResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? ColornamefinderData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Color Name Finder API.

class ColornamefinderData {
  String? inputHex;
  ColornamefinderDataInputRgb? inputRgb;
  bool? exactMatch;
  ColornamefinderDataClosestColor? closestColor;
  List<ColornamefinderDataClosestMatchesItem>? closestMatches;
  int? totalNamedColors;

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
  int? r;
  int? g;
  int? b;

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
  double? distance;
  double? similarity;
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
  int? r;
  int? g;
  int? b;

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
  double? distance;
  double? similarity;
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
  int? r;
  int? g;
  int? b;

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
