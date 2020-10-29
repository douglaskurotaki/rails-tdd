# rails new test_app -T
Dessa forma eliminamos o minitest

### rails db:create:all
gem 'rspec-rails'
gem 'spring-commands-rspec'
### rails g rspec:install 
### bundle exec spring binstub rspec or --all

# Para criar um teste para controllers:
 rails g rspec:controller customers       

 # Instalando devise
  rails generate devise Member   
  rails db:migrate
  rails generate devise:install   