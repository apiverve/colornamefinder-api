# Color Name Finder API - Dart/Flutter Client

Color Name Finder is a tool for finding the closest named color from a hex color value. It uses color distance algorithms to match hex codes to CSS/HTML named colors and provides similarity scores for accurate color identification.

[![pub package](https://img.shields.io/pub/v/apiverve_colornamefinder.svg)](https://pub.dev/packages/apiverve_colornamefinder)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Color Name Finder API](https://apiverve.com/marketplace/colornamefinder?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_colornamefinder: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_colornamefinder/apiverve_colornamefinder.dart';

void main() async {
  final client = ColornamefinderClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'hex': 'FF5733',
      'closest': 1
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "input_hex": "#FF5733",
    "input_rgb": {
      "r": 255,
      "g": 87,
      "b": 51
    },
    "exact_match": false,
    "closest_color": {
      "name": "Tomato",
      "hex": "FF6347",
      "distance": 23.32,
      "similarity": 94.72,
      "rgb": {
        "r": 255,
        "g": 99,
        "b": 71
      }
    },
    "closest_matches": [
      {
        "name": "Tomato",
        "hex": "FF6347",
        "distance": 23.32,
        "similarity": 94.72,
        "rgb": {
          "r": 255,
          "g": 99,
          "b": 71
        }
      },
      {
        "name": "Coral",
        "hex": "FF7F50",
        "distance": 49.41,
        "similarity": 88.81,
        "rgb": {
          "r": 255,
          "g": 127,
          "b": 80
        }
      },
      {
        "name": "Chocolate",
        "hex": "D2691E",
        "distance": 52.82,
        "similarity": 88.04,
        "rgb": {
          "r": 210,
          "g": 105,
          "b": 30
        }
      }
    ],
    "total_named_colors": 141
  }
}
```

## API Reference

- **API Home:** [Color Name Finder API](https://apiverve.com/marketplace/colornamefinder?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/colornamefinder](https://docs.apiverve.com/ref/colornamefinder?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
