source 'https://rubygems.org'

gem 'rails', '3.2.3'

# AGGIUNGO LA GEMMA DI BOOTSTRAP SASS
gem 'bootstrap-sass', '2.0.0'

# Aggiungo gemma bcrypt per creare hash che cripta una password
gem 'bcrypt-ruby', '3.0.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# definisco gemme del solo ambiente di dev e test
group :development, :test do
  gem 'sqlite3', '1.3.9'

  # GEM per il testing in dev
  gem 'rspec-rails', '2.9.0'
  # aggiungo gemma per commenti
  gem 'annotate', '~> 2.4.1.beta'

end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.4'
  gem 'coffee-rails', '3.2.2'


  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.1'


# aggiungo gem in test ambiente, essa simula l'interazione
# fra utente e app usando sintassi in ling naturale
group :test do
  gem 'capybara', '1.1.2'
end


# aggiungo gem del db pgsql in production
group :production do
  gem 'pg', '0.12.2'
  gem 'thin'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
