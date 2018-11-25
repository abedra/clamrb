# clamrb [![Build Status](https://secure.travis-ci.org/abedra/clamrb.png)](http://travis-ci.org/abedra/clamrb?branch=master) ![Gem](https://img.shields.io/gem/dt/clamrb.svg) [![Gem Version](http://img.shields.io/gem/v/clamrb.svg)](https://rubygems.org/gems/clamrb)


This project is a Ruby gem that interfaces with the Clam AV engine using libclamav.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clamrb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install foo

## Usage

To create an instance of `Clamrb` and scan a file use the following example:

```ruby
clamrb = Clamrb.new
result = clamrb.scan "file.txt"
 => #<Clamrb::Result:0x00000000012d2458 @status=:infected, @identifier="Eicar-Test-Signature">
```

There are convenience predicate methods on the `Clamrb::Result` object returned from the scan. These methods allow you to quickly determine the status of the file:

```ruby
result.safe?
=> false
result.error?
=> false
result.virus?
=> true
```

## Performance

Creating a new instance of `Clamrb` causes ClamAV to load its database and initialize its engine. This can take a few seconds in some scenarios. To keep your application performing well you should create an instance of `Clamrb` during the startup sequence of your application and reuse it for your scans to keep overall scan latency to a minimum.

## Dependencies

This gem does not have any ruby dependencies, however, it does rely on some external libraries on the system. To install clamrb you will need a compiler and the associated tools for building native ruby gems, clamav, libclamav, and the associated headers. You can review the [docker](docker) folder to see which dependencies are necessary to install and run this library.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abedra/clamrb.
