# Google Authorizer

This gem has been extracted from the [print_calendar](https://github.com/selemis/print_calendar) application. This code is used to authorize the application in order to be able to access google calendar.

After few months, I needed to access google drive from a ruby application and I noticed that the authorization part was almost the same. So this gem is the extraction of the common code of these two simple applications.

I have used the quickstart.rb example in this [link](https://developers.google.com/google-apps/calendar/quickstart/ruby) as a starting point.

Before runnning any application that includes this gem, you need to place client_secret.json under the project root folder. (This is downloaded from google). This first time that you run the application it will open a browser and it will ask you to copy and paste the string showed in the browser on the screen. This will create the appropriate file under the `~/.credentials/`. This file contains data for authenticating. The next time it will read this file and use its data for the authentication process.

The module GoogleAuthorizer contains the authorize_scope method which takes two arguments. The first argument is the scope.

* The value for google calendar is `Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY`
* The value for google drive `Google::Apis::DriveV3::AUTH_DRIVE_METADATA_READONLY`

The second parameter is the file name (name only, not extension) which will be used in order to store the credentials file under `~/.credentials/` folder. We need diferrent files for different services.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_authorizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_authorizer

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/selemis/google_authorizer.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

