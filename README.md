The calculator app overview and setup

Tech stack:
ruby, sinatra, rspec

1. `bundle install` to install the gems
2. `bundle exec rspec spec` to run all the tests
3. `ruby calculator.rb` to run the application under localhost:4567

Application is to be used as described in the doc.
My primary goal was not to evaluate any code and keep everything SAFE
It listens `localhost:4567/` and accepts an `expression` param, it returns a hash with the given expression and its results.
Expression can contain "+ / * -" operators and integers
It understands the multiplication order
If no expression is provided it returns a static message response

