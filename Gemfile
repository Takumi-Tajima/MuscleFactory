source 'https://rubygems.org'

gem 'rails'

gem 'cssbundling-rails'
# Rails8にdevise gemのtest_helpersが対応していないためmainブランチを指定
gem 'devise', git: 'https://github.com/heartcombo/devise', branch: 'main'
gem 'haml-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg'
gem 'propshaft'
gem 'puma'
gem 'simple_form'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'

gem 'bootsnap', require: false
gem 'kamal', require: false
gem 'thruster', require: false

group :development, :test do
  gem 'brakeman', require: false
  gem 'factory_bot_rails'
  gem 'haml_lint'
  gem 'rspec-rails'
  gem 'sgcop', github: 'SonicGarden/sgcop', branch: 'main'
end

group :development do
  gem 'bullet'
  gem 'html2haml'
  gem 'letter_opener_web'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
