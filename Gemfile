# A sample Gemfile
source "https://rubygems.org"

gem 'jekyll'

group :test do
  gem 'html-proofer', '~> 5.0'
  # Pinned: html-proofer pulls in async. The newest releases (2.41.0, 2.42.0)
  # resolve inconsistently on CI's RubyGems edge; 2.40.0 is stable everywhere.
  gem 'async', '2.40.0'
end
