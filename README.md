# Adnat

This is a Ruby on Rails challenge for [workforce.com](https://workforce.com/uk). This challenge is highly simplified version of the Tanda web app.

## Table of contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Run Tests](#run-tests)
- [Built with](#built-with)
- [Author](#author)

## Prerequisites

You should have Ruby on Rails installed. Check it with:

    rails -v

You should have Node.js v16.13.1 or higher installed. Check it with:

    node -v

You should have yarn installed. Check it with:

    yarn -v


## Installation

Clone the repository on your local. Open directory of the this project on your terminal and run:

    bundle install
    yarn install
    rails db:create db:migrate

Then launch a server with running this command in your terminal:

    rails s

And in another terminal tab launch a Webpack server with running this command:

    yarn build --watch

Open http://localhost:30000 on your browser.


## Run tests
Run this command on your terminal:

    rspec spec

## Built with

- Rails 7.0.3.1
- Ruby 3.0.3
- Semantic HTML5 markup
- Bootstrap 5.2.0


## Author
- [Maryam Fazlali](https://github.com/MeryGoodernak)
