require "bundler/setup"

require_relative "./sinatra_app"

run Shop::App.new
