FaradayMiddleware::Request::Retry
=================================

[![Gem Version][gem-version-svg]][gem-version-link]
[![Build Status][build-status-svg]][build-status-link]
[![Coverage Status][coverage-status-svg]][coverage-status-link]
[![Dependency Status][dependency-status-svg]][dependency-status-link]
[![Code Climate][codeclimate-status-svg]][codeclimate-status-link]
[![Scrutinizer Code Quality][scrutinizer-status-svg]][scrutinizer-status-link]
[![Downloads][downloads-svg]][downloads-link]
[![Docs][docs-rubydoc-svg]][docs-rubydoc-link]
[![License][license-svg]][license-link]

Faraday middleware to manage request retries.

## Description

This gem is a piece of Faraday middleware that adds retry handling for 429 and 503 errors.

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
  builder.use FaradayMiddleware::Refresh::Retry, logger: Logger.new(STDOUT)
  builder.adapter Faraday.default_adapter
end

conn.get "/foo" # sends token
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

This code is extracted from the Zendesk Ruby SDK's `ZendeskAPI::Middleware::Request::Retry` class.

## Copyright and license

Copyright &copy; 2015 Zendesk, 2016 John Wang

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

 [gem-version-svg]: https://badge.fury.io/rb/faraday_middleware-request-retry.svg
 [gem-version-link]: http://badge.fury.io/rb/faraday_middleware-request-retry
 [downloads-svg]: http://ruby-gem-downloads-badge.herokuapp.com/faraday_middleware-request-retry
 [downloads-link]: https://rubygems.org/gems/faraday_middleware-request-retry
 [build-status-svg]: https://api.travis-ci.org/grokify/faraday_middleware-request-retry.svg?branch=master
 [build-status-link]: https://travis-ci.org/grokify/faraday_middleware-request-retry
 [coverage-status-svg]: https://coveralls.io/repos/grokify/faraday_middleware-request-retry/badge.svg?branch=master
 [coverage-status-link]: https://coveralls.io/r/grokify/faraday_middleware-request-retry?branch=master
 [dependency-status-svg]: https://gemnasium.com/grokify/faraday_middleware-request-retry.svg
 [dependency-status-link]: https://gemnasium.com/grokify/faraday_middleware-request-retry
 [codeclimate-status-svg]: https://codeclimate.com/github/grokify/faraday_middleware-request-retry/badges/gpa.svg
 [codeclimate-status-link]: https://codeclimate.com/github/grokify/faraday_middleware-request-retry
 [scrutinizer-status-svg]: https://scrutinizer-ci.com/g/grokify/faraday_middleware-request-retry/badges/quality-score.png?b=master
 [scrutinizer-status-link]: https://scrutinizer-ci.com/g/grokify/faraday_middleware-request-retry/?branch=master
 [docs-rubydoc-svg]: https://img.shields.io/badge/docs-rubydoc-blue.svg
 [docs-rubydoc-link]: http://www.rubydoc.info/gems/faraday_middleware-request-retry/
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-link]: https://github.com/grokify/faraday_middleware-request-retry/blob/master/LICENSE.txt
