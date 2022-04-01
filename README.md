# README

Link to [Heroku](https://bookstore-app-ca.herokuapp.com/).

Link to [Github](https://github.com/Antifact/bookstore).


## Description

### General Overview

This purpose of this application is meant to serve as an online, ebay-esque, bookstore for people to buy and sell their books. With the comfort and ease of being able to browse or sell your book from anywhere, users can utilise this application to do just that without having to go out of their way to go to a library or store. 

The problem this application intends to solve, is to streamline the exchange of buying or selling a book. Compared to going to x amount of stores or even libraries to find something someone would like to purchase, they can come to this website and use the search feature to at least try to find what they're looking for. This will save users valuable time and is a lot more convenient than travelling around. 

The target audience is primarily any adult, as payment is required to buy from other users. However, anyone from teenagers to any aged adult can find use in this application.

The Tech Stack used for this application is Ruby on Rails, HTML, CSS and Heroku for deployment. Devise is utilised for user authentication and registration/logging in for this application. Amazon AWS is used for handling and storing images. Heroku was used for deployment as it is incredibly easy to setup and use, while continuously deploying to the platform. Heroku will automatically detect all settings specified in an application, and has default settings that it will use if not specified in the app. Amazon's AWS was used for image storage as it's rather simple to configure and even easier to integrate into the application, making it highly desirable to utilise.


### Screenshots

![Home](docs/home.png)

![Login](docs/login.png)

![Listings](docs/listings.png)

### Wireframes
![Home](docs/home_wireframe.jpg)

![Listing](docs/listing_wireframe.jpg)


### Databases

The relations for the databases in this application only include the listings being related to the users. Specifically, taking the current user's id and set it as the listing user's id. This way, only the person who made a listing can edit that specific listing. The schema for each database is shown in the following: 

![Listing Schema](docs/listing_schema.png)

![User Schema](docs/user_schema.png)


### User Stories

As a user, I want to be able to make a listing, if I'm signed in.

As a guest, I would like to be able to login or register.

As a guest, I would like to browse the listings.

As a seller, I would like to edit my listing if need be.