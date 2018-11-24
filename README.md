# clamrb

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

```ruby
clamrb = Clamrb.new
clamrb.scan "file.txt"
 => #<Clamrb::Result:0x00000000012d2458 @status=:infected, @identifier="Eicar-Test-Signature">
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abedra/clamrb.
