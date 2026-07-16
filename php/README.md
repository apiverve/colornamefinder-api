# Color Name Finder API - PHP Package

Color Name Finder is a tool for finding the closest named color from a hex color value. It uses color distance algorithms to match hex codes to CSS/HTML named colors and provides similarity scores for accurate color identification.

## Installation

Install via Composer:

```bash
composer require apiverve/colornamefinder
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Colornamefinder\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'hex' => 'FF5733',
    'closest' => 1
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Colornamefinder\Client;
use APIVerve\Colornamefinder\Exceptions\APIException;
use APIVerve\Colornamefinder\Exceptions\ValidationException;

try {
    $response = $client->execute(['hex' => 'FF5733', 'closest' => 1]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/colornamefinder?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/colornamefinder?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/colornamefinder?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
