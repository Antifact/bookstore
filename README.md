# README

Link to [Heroku](https://bookstore-app-ca.herokuapp.com/).

Link to [Github](https://github.com/Antifact/bookstore).


## Description

### General Overview

This application is designed to serve as an online, ebay-esque, bookstore for people to buy and sell their books. With the comfort and ease of being able to browse or sell your book from anywhere, users can utilise this application to do just that without having to go out of their way to go to a library or store. 

The problem this application intends to solve, is to streamline the exchange of buying or selling an item, exclusively a book. Compared to going to x amount of stores, physically or online, or even libraries to find something someone would like to purchase, they can come to this website that is specifically focused on selling books. This will save users valuable time and is a lot more convenient than travelling around or searching for an online service. As this application is focused on books alone, the chances are greater for users to buy and sell their books as opposed to going to another marketplace application, which offer a wide variety of items.

As books are read by people of all ages, the application's target audience has the advantage of being anyone. However, the target audience is expected to be primarily adult, as payment is required to buy from other users. The application does not target a specific audience and has the advantage of having a vast target audience, which is to maximise on the usage of the app.

The Tech Stack used for this application is Ruby on Rails, HTML and CSS, using Bootstrap as a framework for CSS, and PostgresQL for the database. Devise is utilised for user authentication and registration/logging in for this application. Third party services that this application use are Amazon's AWS and Heroku. Amazon's AWS is a cloud platform that offers a wide variety of services. AWS is well-known, highly supported, rather simple to configure and even easier to integrate into the application, making it highly desirable to utilise. In this application, it is used for image uploading and serving. Heroku is another cloud platform that is used in this application, specfically for deployment. It is incredibly easy to setup and use, enabling the ability to continuously deploy to the platform. Heroku builds, runs and operates the application after being given the source code and serves it instantly after building. It supports multiple languages, making it a reliable choice for developers to use.

The model associations in this application are incredibly simple, as there are only two models so far. The first is the listing model, and its relation is with the user model, as a listing must belong to a user to be made. This links the listing to the user, by taking the user id of a logged in user when they create a post and attaches it to them. This allows the user who has created a listing to edit that listing and, in future, users can browse listings made by a user. Having this relation also enables mitigation of unauthorised access of editing listings or deleting posts by people that are neither the creator nor an administrator. The user model only has a relation in that a user can have multiple listings. As the listing must have a user, the user can also have more than one listing on the website. 

### Screenshots

![Home](docs/home.png)

![Login](docs/login.png)

![Listing](docs/listing.png)

### Wireframes

![Home](docs/home_wireframe.png)

![Browse Listings](docs/all_listings_wireframe.png)

![Listing](docs/listing_wireframe.png)

![Login](docs/login_wireframe.png)

![Register](docs/register_wireframe.png)

![Mobile Home](docs/mob_home_wireframe.png)

![Mobile Navbar](docs/mob_nav_wireframe.png)

![Mobile Register](docs/mob_register_wireframe.png)

![Mobile Login](docs/mob_login_wireframe.png)


### ERD

![ERD](docs/erd.png)


### Databases

The relations for the databases in this application only include the listings being related to the users. Specifically, taking the current user's id and set it as the listing user's id. This way, only the person who made a listing can edit that specific listing. The schema for each database is shown in the following: 

![Listing Schema](docs/listing_schema.png)

![User Schema](docs/user_schema.png)

Further relations that will be implemented will include a commenting and rating system, that will allow both posts and users to have multiple ratings and comments from other users. As per the ERD, there is only the relation between the listings to users. A listing can have a comment or rating, but the comment or rating must belong to a user. Listings will then have ```has_many :comments``` in the model to allow for multiple comments or ratings. 


### User Stories

As a guest, I want to be able to log in, so that I can create a listing.

As a seller, I want to be able to edit my listing, in case I change my mind on some details.

As a user, I want to be able to register, so that I can buy and sell my books.

As an admin, I want to be able to edit and delete listings, in case something inappropriate is uploaded.

As a user, I want to be able to log in or log out and be redirected to the home page, so that I don't have to do it myself.