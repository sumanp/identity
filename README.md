# README

## How to run the app
**Introduction**
Rails 7.1.3 is used to create the rails app with Ruby version 3.2.2.
Rspec is used to write tests. Rake task is created to import data.json into the DB. 

Note: Tests are limited due to time constraints. Additional tests can be written for details JSON endpoints.

**Run the app**
1. `git clone https://github.com/sumanp/identity`
2. `cd identity && bundle install`
3. `rails db:setup`
4. `rake "import:data[your_path/data.json]"`
5. `bundle exec rails s`

**Possible improvements**
- Bootstrap could be installed for better UI
- Entire app could be turned SPA with Hotwire
- Delete should automatically remove the person/detail without the need to reload