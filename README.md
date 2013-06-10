# EasyWebService

A gem that allows you to access web services easily.

## Build status

[![Build Status](https://travis-ci.org/sumanmukherjee03/easy_web_service.png)](https://travis-ci.org/sumanmukherjee03/easy_web_service)

## Installation

Add this line to your application's Gemfile:

    gem 'easy_web_service'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_web_service

## Usage
Specify the basic configurations in a configuration file
```yaml
development:
  foo:
    v1:
      base_uri: 'http://example.com'
      root_path: 'path_to_api'
      authentication_scheme: 'api_key'
    authentication:
      api_key:
        key: yourapikey
```
Load the basic configuration in an initializer file
```ruby
def EasyWebService::Setting.config
  YAML::load_file("#{Rails.root}/config/web_services.yml"))[Rails.env]
end
```

```ruby
class User
    resource = OpenStruct.new(:id => 1, :name => 'Test', :data_for_create => {:id => 1, :name => 'Test'})
    resource.stub!(:id).and_return(1)
    resource
  end

  def create_tag
    authentication_scheme = EasyWebService::RequestHandler::Http::Authentication::ApiKey.new
    EasyWebService::Request.new('foo', 'v1', authentication_scheme)
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) 2013 Suman Mukherjee

MIT License

For more information on license, please look at LICENSE.txt
