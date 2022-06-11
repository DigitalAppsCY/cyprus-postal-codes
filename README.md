# Cyprus Postal Codes API Rubygem

[![Build Status](https://github.com/DigitalAppsCY/cyprus-postal-codes/workflows/CI/badge.svg)](https://github.com/DigitalAppsCY/cyprus-postal-codes/actions)

![logo](cyprus_postal_codes.png)

The easiest and most complete rubygem for [CYPRUS POST: POSTAL CODES API](https://documenter.getpostman.com/view/6477303/RztmtUjG).

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Resources](#resources)
  - [Addresses](#addresses)
  - [Districts](#districts)
  - [Areas](#areas)
  - [Search](#search)
  - [Government Services](#government-Services)
  - [Post Office Boxes](#post-office-boxes)
  - [Parcel 24 Locations](#parcel-24-locations)
  - [Occupied Areas](#occupied-areas)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)
- [Code of Conduct](#code-of-conduct)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cyprus-postal-codes'
```

And then execute:

```bash
$ bundle install
```    

Or install it yourself as:

```bash
$ gem install cyprus-postal-codes
```

And access the library in Ruby:

```ruby
require 'cyprus_postal_codes'
```

## Usage

To access the API, you'll need to create a `CyprusPostalCodes::Client` and pass in your API key. You can use [Cyprus Post](https://www.cypruspost.post/en/contact) contact form to request your API key.

The API is multi-language. has `lng` param on each resources. It can either be `el` which will return the response in greek or `en` which will return the response in english.

### The client will default to the greek

```ruby
client = CyprusPostalCodes::Client.new(api_key: ENV["CYPRUS_POSTAL_CODES_API_KEY"])
```

### The client will use english

```ruby
client = CyprusPostalCodes::Client.new(api_key: ENV["CYPRUS_POSTAL_CODES_API_KEY"], lng: "en")
```

The client then gives you access to each of the resources.

## Resources

The gem maps as closely as we can to the Cyprus Postal Codes API so you can easily convert API examples to gem code.

Responses are returned as `Hash`.

### Addresses

Retrieve the addresses or P.O.Boxes within selected post code.

Required parameter:
- `post_code`, must be 4 characters

```ruby
client.addresses(post_code: 1017)
```

### Districts

Retrieve districts where post code search can be applied.

```ruby
client.districts
```

### Areas

Retrieve areas in selected district.

Required parameter
- `district`, available districts can be found calling [district](#districts)

```ruby
client.areas(district: "lefkosia")
```

### Search

Retrieves addresses filtered by the parameter.

Required parameter:
- `param`, must be at least 3 characters with characters contained in street name
- `district`, available districts can be found calling [district](#districts)

Optional parameter:
- `areas`, areas can be found calling [areas](#areas)

```ruby
client.search(district: "lefkosia", param: "arc")
```

### Government Services

Retrieve government authorities' information with param be contained in name. In order to filter locations by their district, you can fill district parameter with param attribute.

Required parameter:
- `param`, must be at least 3 characters with characters contained in name

Optional parameter:
- `district`, available districts can be found calling [district](#districts)

```ruby
client.government_services(param: "arc")
```

### Post Office Boxes

Retrieve post office box's information with selected number.

Required parameter:
- `number`, must be at least 5 characters

```ruby
client.post_office_boxes(number: 12220)
```

### Parcel 24 Locations

Retrieve Parcel24 location's information with param be contained in name. In order to filter locations by their district, you can fill district parameter with param attribute.

Optional parameter:
- `param`, must be at least 3 characters with characters contained in name
- `district`, available districts can be found calling [district](#districts)

```ruby
client.parcel24_locations
```

### Occupied Areas

Retrieve addresses of occupied area in selected district with param be contained in street name. In order to filter locations by their district, you can fill district parameter with param attribute.

Optional parameter:
- `param`, characters contained in street name
- `district`, available districts can be found calling [district](#districts)

```ruby
client.occupied_areas
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cyprus-postal-codes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/cyprus-postal-codes/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CyprusPostalCodes project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cyprus-postal-codes/blob/main/CODE_OF_CONDUCT.md).
