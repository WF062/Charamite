source "https://rubygems.org"

ruby '3.1.4'

gem "rails", "~> 7.1.5", ">= 7.1.5.1"
gem "sprockets-rails"
gem "pg", ">= 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "tailwindcss-rails", "~> 4.2"

gem "sorcery"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
  gem "dockerfile-rails", ">= 1.7"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
