# Sweater Weather

## Project Description
Sweather Weather was developed as a school project by Didi Dodson at the Turing School of Software and Design in 2022. The premise of the project is that  users can use a notional frontend interface to find weather and map information to plan for a roadtrip. The backend portion of the project is presented in this repo, and is an API service that both consumes and exposes API endpoints for a notional frontend. The MapQuest API (route and directions), the OpenWeather API, and the Unsplash API are consumed, while user data is exposed.

### Endpoints
#### Forecast Endpoint
**_Consumes the MapQuest and OpenWeather APIs_**\
![Example output](/app/mailers/endpoint1.png)

#### Background Endpoint
**_Consumes the MapQuest Unsplash APIs_**\
![Example output](/app/mailers/endpoint2.png)

#### User Registration Endpoint - Create User object
**_Exposes user data for registration purposes_**\
![Example output](/app/mailers/endpoint3.png)

#### User Login Endpoint - Session creation
**_Exposes user data for login purposes_**\
![Example output](/app/mailers/endpoint4.png)

#### Roadtrip Endpoint
**_Consumes Mapquest and OpenWeather, Exposes User_**\
![Example output](/app/mailers/endpoint5.png)

## Shipping Changes
If you would like to make changes to this project, please contact the owner of this repository via GitHub.

## Setup
This project was developed via Ruby 2.7.2, on Rails 5.2.6.

To access the dev environment for this app please follow these steps:
* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
  * `bundle`
  * `bundle exec figaro install`
  * `rails db:create`

You can access the test suite (includes use of Capybara, RSpec, and Pry) via `bundle exec rspec`.
