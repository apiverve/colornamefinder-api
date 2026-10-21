# Color Name Finder API - Ruby Gem

Color Name Finder matches any hex color code to its closest named CSS color. Send a hex value to get the matching color name, RGB coordinates, and an exact match flag.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_colornamefinder'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_colornamefinder
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_colornamefinder'

# Initialize the client
client = APIVerve::Colornamefinder::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  hex: "FF5733",
  closest: 1
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ hex: "FF5733", closest: 1 })
  puts response["data"]
rescue APIVerve::Colornamefinder::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Colornamefinder::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Colornamefinder::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/colornamefinder?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/colornamefinder?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/colornamefinder?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
