# BOOKING-APP-API

> This is the backend for the [Social-app](https://github.com/vic778/mern-project-like-instagram) web application for social media: you have a list of posts that users has posted before doing thoses actions you need to `sign_up`. The backend is a REST API that allows you to create, read, update and delete post. It also allows you to comment like or follow each other .
This API is made these models:
- User model
- Post model
- Comment model
- Follow unfollow Model
- Like

### Deployment
[Base URL](https://sheltered-tor-84017.herokuapp.com/)


The API has the following endpoints:


allow user to authenticate and return a token

`POST /api/users/login`

allows user to create an account

`POST /api/users`

Edit user informations

`PUT /api/user`

Delete user informations

`DELETE /api/user`

returns all posts

`GET /api/posts `

allows user to create a post

`POST /api/posts`

returns a specific post

`GET /api/posts/:id`

allows user to edit a motorcyle

`PUT /api/posts/:id`

allows user to delete a motorcycle

`DELETE /api/posts/:id`

allows user to comment a post

`POST /api/posts/:id/comments`

allows user to like a post

`POST /api/posts/:id/likes`

allows user to dislake

`DELETE /api/posts/:id/like/:id`

allows user to follow another user

`POST /api/v2/user/relationships/`

allows user to unfollow   

`DELETE /api/relationships/:id`


## Built With

- Rails
- Ruby 
- Postgresql
- Devise
- JWT
- ActiveRecord Serializer
- ActiveRecord Image Uploader
- Heroku

## Getting Started

Here are the steps to follow in order to get this project on your local computer.

### Prerequisites

`rails v7.0.2 +`

`ruby v3.0.2 +`

### Setup

clone this repo by typing `git clone https://github.com/vic778/social-backend`

### Install

install the dependencies by typing `bundle install`

### Usage

start the local server by running `rails s`

### Testing

run the tests by typing `bundle exec rspec`


### Documentation


## Author

👤 **Victor Barh**

- GitHub: [@Vvic778](https://github.com/vic778)
- Twitter: [@victoirBarh](https://twitter.com/)
- LinkedIn: [LinkedIn](https://linkedin.com/in/victoir-barh)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used !

## 📝 License

This project is [MIT](lic.url) licensed.

