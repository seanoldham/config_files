gem 'bootstrap-sass'

if yes?("Would you like to install Devise?")
  gem "devise"
  generate "devise:install"
  model_name = ask("What would you like the user model to be called? [user]")
  model_name = "user" if model_name.blank?
  generate "devise", model_name
end

gem_group :development, :test do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'rails_best_practices'
  gem 'xray-rails'
end

after_bundle do
  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end

rake "db:create"
rake "db:migrate"
