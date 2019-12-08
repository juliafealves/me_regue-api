# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Rack::Cors do
  allow do
    orgins '*'
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