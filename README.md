<div align="center">
  <img src="public/assets/project_logo.png" />
  <h2>Product Catalogue</h2>
  <p>A web application with ability to create multiple properties and values of a product in a single form. </p>
</div>

<div align="center">

  <img src="https://img.shields.io/badge/Ruby_3.1.2-CC342D?style=for-the-badge&logo=ruby&logoColor=white">

  <img src="https://img.shields.io/badge/Rails_7.0.4-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white">

  <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white">

</div>

<div align="center">
  <img src="https://visitor-badge-reloaded.herokuapp.com/badge?page_id=juzershakir.imdb_api&color=000000&lcolor=000000&style=for-the-badge&logo=Github"/>
  <a href="https://wakatime.com/badge/user/ccef187f-4308-4666-920d-d0a9a07d713a/project/509003f7-2b71-4958-be09-1a0d27b03a0c"><img src="https://wakatime.com/badge/user/ccef187f-4308-4666-920d-d0a9a07d713a/project/509003f7-2b71-4958-be09-1a0d27b03a0c.svg" alt="wakatime"></a>
</div>

-------

<br>

## Summary
This project is created based on [these guiedlines](https://gist.github.com/kitwalker12/a46b1c2cc8363cf94fdbdc7feae3573f)

------

## Running the App

### Setup env for the app

The following will install required version of ruby (make sure [rvm is installed](https://rvm.io/rvm/install).)

Run the following commands to in your terminal: 

```bash
git clone git@github.com:JuzerShakir/product_catalogue.git

gem install rails -v 7.0.4

cd product_catalogue

bundle install
```

### Setup PostgreSQL Credentials

To successfully create development and test database, you will need to update `config.database.yml` file with correct postgresql username and password.

There are multiple ways of passing it, we can either use ENV or Rails Credentials:

#### With ENV

There are multiple ways of creating it:
 
1. With Bash/ZSH
2. With Figaro Gem
3. Or Manually loading ENV hash keys.

For this project I have used the first option but you're re open to choose any you see fit. You can refer to [this guide](#http://railsapps.github.io/rails-environment-variables.html) to learn more about these options. 


#### With Rails Credentials

```bash
EDITOR="code --wait" rails credentials:edit
```

_`code` for Visual Studio Code_
_`subl` for sublime_

This will open `credential.yml` file, now enter your credential as follows:

```
database:
  username: your_username
  password: your_password
```

Hit `ctrl + s` to save and then close the `credential.yml` file from the editor. This will save the credentials. To check if it was a success, run the following inside the rails console:

```
Rails.application.credentials.dig(:database, :username)
```

Now, inside the `database.yml` file give the following values to the credential keys:

```yml
  username: <%= Rails.application.credentials.dig(:database, :username) %>
  password: <%= Rails.application.credentials.dig(:database, :password) %>
```

Once you have setup your database credentials, we can now create and setup the database:
```bash
rails db:setup
```
