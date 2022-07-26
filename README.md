# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Purpose
---
This is a project by [Tyree Webber](https://github.com/TyreeWebber) and was created as part of the [Lighthouse Labs](https://www.lighthouselabs.ca/) curriculum. It is not intended for professional use. ~~if you are using it for professional use please pay me i'm poor.~~
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

For testing success scenarios.
- Card Number # 4111 1111 1111 1111
- Expiry (Any Future Date)
- CVV (Any 3 Digit Number)

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Final Product
---
Main Page
!["Screenshot of main page"](https://raw.githubusercontent.com/TyreeWebber/jungle-rails/master/docs/mainpage.png)

Signup Page
!["Screenshot of signup page"](https://raw.githubusercontent.com/TyreeWebber/jungle-rails/master/docs/signupPage.png)

Login Page
!["Screenshot of login page"](https://raw.githubusercontent.com/TyreeWebber/jungle-rails/master/docs/loginPage.png)

Empty Cart
!["Screenshot of empty cart"](https://raw.githubusercontent.com/TyreeWebber/jungle-rails/master/docs/emptyCart.png)

Filled Cart
!["Screenshot of filled cart"](https://raw.githubusercontent.com/TyreeWebber/jungle-rails/master/docs/filledCart.png)