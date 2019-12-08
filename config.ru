# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Rack::Cors do
  allow do
    origins 'localhost:3000', '127.0.0.1:3000',
            /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/
    # regular expressions can be used here
    origins 'localhost:4200', '127.0.0.1:4200',
            /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/
    # regular expressions can be used here

    resource '*',
             :methods => [:get, :post, :delete, :put, :patch, :options, :head],
             :max_age => 600
    # headers to expose
  end

  allow do
    origins '*'
    resource '/public/*', :headers => :any, :methods => :get
  end
end