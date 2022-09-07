![Header](https://user-images.githubusercontent.com/98415017/188760792-2b0a5ae9-1934-4d98-ba0e-0d0bd7e84b6a.png)

<p align="center">
    <a href="https://treat-streets-fe.herokuapp.com/"><strong>Treat Streets - Deployed Link »</strong></a>
  </p>
  <p align="center">
    <a href="https://github.com/Treat-Streets/treat-streets-fe"><strong>Treat Streets - Front End Repo »</strong></a>
  </p>
  
  ## Table of Contents

- [Abstract](#abstract)
- [Built With](#built-with)
- [Installation](#installation)
- [GraphQL Example responses and requests](#graphql-example-responses-and-requests)
- [Back End Contributors](#back-end-contributors)
- [Front End Contributors](#front-end-contributors)

### Abstract
This Halloween themed application is meant to give trick-or-treaters and parents more information about participating homes in their area. The application allows users to view a map of houses in their area who are registered to be giving out candy for Halloween and to register their own house to be added to the map. This is the Back End repository built with Ruby on Rails with GraphQL endpoints.   


### Built With
![Ruby](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![GraphQL](https://img.shields.io/badge/GraphQl-E10098?style=for-the-badge&logo=graphql&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white)
![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
![Miro](https://img.shields.io/badge/Miro-F7C922?style=for-the-badge&logo=Miro&logoColor=050036)


Using CircleCI for Continuous Integration

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/Treat-Streets/treat-streets-be/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/Treat-Streets/treat-streets-be/tree/main)


## Installation

1. Clone this directory to your local repository using the SSH key:

```shell

$ git clone git@github.com:Treat-Streets/treat_streets_be.git

```

2. Install gems for development using Bundler:
- *If Bundler is not installed, first run the following command:*

```shell
$ gem install bundler
```

```shell

$ bundle install

```

3. Set up database:

```shell

$ rails db:{drop,create,migrate,seed}

```

4. Run test suite:

```shell

$ bundle exec rspec

```

5. Set up Application.yml:

```shell

$ bundle exec figaro install

```

6. Inside your Application.yml:


```ruby
MAPQUEST_KEY: <Mapquest_key> 
```
&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://developer.mapquest.com/">Get Key Here »</a>

```ruby
YELP_API_KEY: <Yelp_key>
```

&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.yelp.com/developers/documentation/v3/authentication">Get Key Here »</a>



7. Run your local development server:

```shell

$ rails s

```



## GraphQL Example responses and requests
### Query Locations
Retrieves all locations in the database. Listed are all the attributes that can be requested.
A minimum of one attribute of the locations must be requested in the query.

Request
```gql
query {
    locations {
        streetAddress
        city
        state
        zipcode
        locationType
        scarinessLevel
        description
        startTime
        endTime
        image
        latitude
        longitude
    }
}
```
Response
```json
{
    "data": {
        "locations": [
            {
                "streetAddress": "2485 W Hillside Ave",
                "city": "Denver",
                "state": "CO",
                "zipcode": "80219",
                "locationType": "house",
                "scarinessLevel": 4,
                "description": "IT'S THE COOLEST EVER. ",
                "startTime": "4:00 pm",
                "endTime": "8:00 pm",
                "image": "url",
                "latitude": 39.670988,
                "longitude": -105.016814
            },
            {
                "streetAddress": "1816 S Newton St",
                "city": "Denver",
                "state": "CO",
                "zipcode": "80219",
                "locationType": "house",
                "scarinessLevel": 1,
                "description": "We don't like to scare kids!",
                "startTime": "4:00 pm",
                "endTime": "7:00 pm",
                "image": "url",
                "latitude": 39.684066,
                "longitude": -105.038085
            },
            {
                "streetAddress": "13446 W 22nd Place",
                "city": "Golden",
                "state": "CO",
                "zipcode": "80401",
                "locationType": "house",
                "scarinessLevel": 2,
                "description": "Megs Spoooky House!!",
                "startTime": "4:00 pm",
                "endTime": "8:00 pm",
                "image": "url",
                "latitude": 39.752514,
                "longitude": -105.150996
            }
          ]
      }
}
```

## Create Location
### Successful Request
Request
```gql
mutation {
      createLocation (input: {
        streetAddress: "10490 East Aberdeen Ave",
        city: "Englewood",
        state: "CO",
        zipcode: "80111",
        locationType: "House",
        scarinessLevel: 0,
        description: "None",
        startTime: "6:00",
        endTime: "8:00",
        image: "url",
        email: "t@gmail.com"
      }) {
    	location {
          streetAddress
          city
          state
          zipcode
          locationType
          scarinessLevel
          description
          startTime
          endTime
          image
          latitude
          longitude
          }
          errors
        }
      }
```
Response
```json
{
    "data": {
        "createLocation": {
            "location": {
                "streetAddress": "10490 East Aberdeen Ave",
                "city": "Englewood",
                "state": "CO",
                "zipcode": "80111",
                "locationType": "House",
                "scarinessLevel": 0,
                "description": "None",
                "startTime": "6:00",
                "endTime": "8:00",
                "image": "url",
                "latitude": 39.607575,
                "longitude": -104.867424
            },
            "errors": []
        }
    }
}
```
### Failed Request
Addresses are checked for validity. If an incorrect street address, city, or state 
are entered no location will be created in the database.

Bad Request - The incorrect city is given for this street address
```gql
mutation {
      createLocation (input: {
        streetAddress: "10490 East Aberdeen Ave",
        city: "Aurora",
        state: "CO",
        zipcode: "80111",
        locationType: "House",
        scarinessLevel: 0,
        description: "",
        startTime: "6:00",
        endTime: "8:00",
        image: "url",
        email: "t@gmail.com"
      }) {
      location {
          streetAddress
          city
          state
          zipcode
          locationType
          scarinessLevel
          description
          startTime
          endTime
          image
          latitude
          longitude
          }
          errors
        }
      }
```
Response
```json
{
    "data": {
        "createLocation": {
            "location": null,
            "errors": [
                "Invalid Address."
            ]
        }
    }
}
```

## Get coordinates from zipcode
### Successful Request
Request
```gql
{
    coordinates (zipcode: "80111"){
        latitude
        longitude
        errors
    }
}
```
Response
```json
{
    "data": {
        "coordinates": {
            "latitude": 39.612472,
            "longitude": -104.881366,
            "errors": []
        }
    }
}
```
### Failed Request
Zipcodes are validated to check for correct length and that they only contain integers.

Bad Requests
```gql
{
    coordinates (zipcode: "8011"){
        latitude
        longitude
        errors
    }
}
```
```gql
{
    coordinates (zipcode: "80d11"){
        latitude
        longitude
        errors
    }
}
```
Response
```json
{
    "data": {
        "coordinates": {
            "latitude": null,
            "longitude": null,
            "errors": [
                "Invalid Zip Code."
            ]
        }
    }
}
```


## Back End Contributors

<table>

  <tr>
   <td align="center"><a href="https://github.com/tjhaines-cap"><img src="https://avatars.githubusercontent.com/u/60715457?v=4" width="100px;" alt=""/><br /><sub><b>Thomas H. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/thomas-haines-9b93451a0/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/devAndrewK/"><img src="https://avatars.githubusercontent.com/u/98759023?v=4" width="100px;" alt=""/><br /><sub><b>Andrew K. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/andrewkingdev/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/Tross0208"><img src="https://avatars.githubusercontent.com/u/46985513?v=4" width="100px;" alt=""/><br /><sub><b>Tyler R. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/tyler-ross-0b206122b/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>
    
  </tr>
</table>

## Front End Contributors

<table>
  <tr>
   <td align="center"><a href="https://github.com/megschuetz"><img src="https://avatars.githubusercontent.com/u/98415017?v=4" width="100px;" alt=""/><br /><sub><b>Megan S. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/megan-schuetz/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>
    
   <td align="center"><a href="https://github.com/ASands17"><img src="https://avatars.githubusercontent.com/u/93043035?v=4" width="100px;" alt=""/><br /><sub><b>Amanda S. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/amanda-sands1/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/VictoriaFC"><img src="https://avatars.githubusercontent.com/u/98445902?v=4" width="100px;" alt=""/><br /><sub><b>Victoria F. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/victoria-fox-collis/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>
    <td align="center"><a href="https://github.com/CorCanavan"><img src="https://avatars.githubusercontent.com/u/97919748?v=4" width="100px;" alt=""/><br /><sub><b>Corinne C. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/corinnecanavan/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

  </tr>
 </table>
 
