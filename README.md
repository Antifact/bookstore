# README

Caleb's janky bookstore for CA T2 Assignment 2!!! :))

This application is meant to serve as an online, ebay-esque, bookstore for people to buy and sell their books. Instead of travelling to a library and risk getting COVID, you can just buy a book online through this app. So cool. 

The target audience is for those who want to read books and are somewhat computer literate.


Link to [Heroku](https://bookstore-app-ca.herokuapp.com/) 

Link to [Github](https://github.com/Antifact/bookstore) here

## Screenshots

![Home](docs/home.png)

![Login](docs/login.png)

![Listings](docs/listings.png)

## Wireframes
![Home](docs/home_wireframe.jpg)

![Listing](docs/listing_wireframe.jpg)

## Tech Stack

The Tech Stack used for this application is Ruby on Rails, HTML, CSS and Heroku for deployment. Devise is utilised for user authentication and registration/logging in for this application. Amazon AWS is used for handling and storing images. 


## Databases

The relations for the databases in this application only include the listings being related to the users. Specifically, taking the current user's id and set it as the listing user's id. This way, only the person who made a listing can edit that specific listing. The schema for each database is shown in the following: 

![Listing Schema](docs/listing_schema.png)

![User Schema](docs/user_schema.png)


## User Stories

As a user, I want to be able to sell my book.
As a guest, I would like to be able to login or register.
As a guest, I would like to browse the listings.
As a seller, I would like to edit my listing if need be.

