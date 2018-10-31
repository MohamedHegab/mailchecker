# Mailchecker

## Features

Mailchecker has the following:

- External service structure
- Error and Exception Handling
- Rspec Controller Testing
- Rspec Stubbing API calling

* Ruby version 2.5.0

* System dependencies
  - [Mailboxlayer](https://mailboxlayer.com/documentation)
  - [Rspec](https://github.com/rspec/rspec-rails)

* Configuration

* Database creation
Postgresql Database
```
mv config/application-example.yml config/application.yml
```
* Database initialization
```
bundle exec rake db:create && bundle exec rake db:migrate
```
* How to run the test suite
```
bundle exec rspec
```
## Authors

* **Mohamed Hegab** - *Initial work* - [MohamedHegab](https://github.com/MohamedHegab)

