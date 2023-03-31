FaradayMiddleware::Request::Retry
=================================

[![Gem Version][gem-version-svg]][gem-version-url]
[![Build Status][build-status-svg]][build-status-url]
[![Coverage Status][coverage-status-svg]][coverage-status-url]
[![Code Climate][codeclimate-status-svg]][codeclimate-status-url]
[![Scrutinizer Code Quality][scrutinizer-status-svg]][scrutinizer-status-url]
[![Docs][docs-rubydoc-svg]][docs-rubydoc-url]
[![License][license-svg]][license-url]

Faraday middleware to manage request retries.

## Description

This gem is Faraday middleware that adds retry handling for 429 and 503 errors.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'faraday_middleware-request-retry'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install faraday_middleware-request-retry
```

## Usage

```ruby
require 'faraday'
require 'faraday_middleware-request-retry'
require 'logger'

conn = Faraday.new(url: "http://example.com") do |builder|
  builder.use FaradayMiddleware::Request::Retry, logger: Logger.new(STDOUT), retry_after: 15
  builder.adapter Faraday.default_adapter
end

conn.get "/foo" # sends token
```

Options include:

| Option | Values | Optional | Default |
|--------|--------|----------|---------|
| `:logger` | `Logger` object | optional |
| `:retry_after` | Default retry seconds | optional | `10` seconds |
| `:error_codes` | Array of error codes, e.g. `[429, 503, 504]` | optional | `[429, 503]` |

### External Use

The core retry functionality can be used separately from Faraday when necessary. For example, when requests cannot be replayed, e.g. when `Faraday::UploadIO` is used.

```ruby
res = faraday_client.get '/my_url'

retry_util = FaradayMiddleware::Request::RetryUtil.new

# The following will return `true` for retry, `false` for don't,
# while sleeping when necessary
want_retry = retry_util.retry_status res.status, res.headers['Retry-After']
```

## Change Log

See [CHANGELOG.md](CHANGELOG.md)

## Links

Project Repo

* https://github.com/grokify/faraday_middleware-request-retry

## Problems, Comments, Suggestions, Contributions?

Any reports of problems, comments or suggestions are most welcome.

Please report these on [Github](https://github.com/grokify/faraday_middleware-request-retry)

## Credits

This library is originally based on code extracted from the Zendesk Ruby SDK's `ZendeskAPI::Middleware::Request::Retry` class, in [v1.14.0](https://github.com/zendesk/zendesk_api_client_rb/releases/tag/v1.14.0) (commit [2c2b52e](https://github.com/zendesk/zendesk_api_client_rb/blob/2c2b52ea390b3641d4af383759217fda75bc74ec/LICENSE)) available under the Apache 2.0 license. 

## Copyright and license

Copyright &copy; 2015 Zendesk, 2016-2023 John Wang

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

 [gem-version-svg]: https://badge.fury.io/rb/faraday_middleware-request-retry.svg
 [gem-version-url]: http://badge.fury.io/rb/faraday_middleware-request-retry
 [downloads-svg]: http://ruby-gem-downloads-badge.herokuapp.com/faraday_middleware-request-retry
 [downloads-url]: https://rubygems.org/gems/faraday_middleware-request-retry
 [build-status-svg]: https://github.com/grokify/faraday_middleware-request-retry/workflows/ruby%20build/badge.svg
 [build-status-url]: https://github.com/grokify/faraday_middleware-request-retry/actions
 [coverage-status-svg]: https://coveralls.io/repos/grokify/faraday_middleware-request-retry/badge.svg?branch=master
 [coverage-status-url]: https://coveralls.io/r/grokify/faraday_middleware-request-retry?branch=master
 [dependency-status-svg]: https://gemnasium.com/grokify/faraday_middleware-request-retry.svg
 [dependency-status-url]: https://gemnasium.com/grokify/faraday_middleware-request-retry
 [codacy-svg]: https://api.codacy.com/project/badge/Grade/d2c515165a60402eb10410cf4bd51f50
 [codacy-url]: https://www.codacy.com/app/grokify/faraday_middleware-request-retry
 [codeclimate-status-svg]: https://codeclimate.com/github/grokify/faraday_middleware-request-retry/badges/gpa.svg
 [codeclimate-status-url]: https://codeclimate.com/github/grokify/faraday_middleware-request-retry
 [scrutinizer-status-svg]: https://scrutinizer-ci.com/g/grokify/faraday_middleware-request-retry/badges/quality-score.png?b=master
 [scrutinizer-status-url]: https://scrutinizer-ci.com/g/grokify/faraday_middleware-request-retry/?branch=master
 [docs-rubydoc-svg]: https://img.shields.io/badge/docs-rubydoc-blue.svg
 [docs-rubydoc-url]: http://www.rubydoc.info/gems/faraday_middleware-request-retry/
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-url]: https://github.com/grokify/faraday_middleware-request-retry/blob/master/LICENSE.txt
