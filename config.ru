require "./config/environment"

run Rack::URLMap.new("/health" => Health, "/signup" => Signup)

