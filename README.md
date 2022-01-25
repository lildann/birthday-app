## Project set up template

```
bundle init
```
List gems in Gemfile
```
bundle install
rspec --init
```
* Initialize rspec to configure the test suite, and generate spec_helper.rb 

* Create app.rb file and set up basic Sinatra application

* Create config.ru file which configures the `$ rackup` command to run the application in app.rb

* Configure Capybara to talk to Sinatra:
```
# at the top of spec/spec_helper.rb

# Set the environment to "test"
ENV['RACK_ENV'] = 'test'

# Bring in the contents of the `app.rb` file. The below is equivalent to: require_relative '../app.rb'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# Tell Capybara to talk to BookmarkManager
Capybara.app = BookmarkManager

### the rest of the file ###
```


##### The 'CLASSIC' style of sinatra
```
require 'sinatra'
require "sinatra/reloader" if development?

get '/' do
  'hello!'
end
```
Run in terminal: `$ ruby app.rb`


##### The 'MODULAR' style of Sinatra
Unlike the classic style, the file app.rb defines a class, and we define routes inside that class:
```
require 'sinatra/base'
require 'sinatra/reloader'

class MyApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # our routes would go here

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
```

* Rather than `$ ruby app.rb`, a more standard way to run Ruby web applications is to use rackup (within gem 'webrick') — as you don't have to specify the file name every time. 
* Rackup requires a config.ru file that tells the app to run:
```
require './app'
run MyApp
```
* Run from command line with `$ rackup`




