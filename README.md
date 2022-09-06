# README
  <p align="center">
    <a href="https://treat-streets-fe.herokuapp.com/"><strong>Treat Streets - Deployed Link »</strong></a>
  </p>
  <p align="center">
    <a href="https://github.com/Treat-Streets/treat-streets-fe"><strong>Treat Streets - Front End Repo »</strong></a>
  </p>

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/Treat-Streets/treat-streets-be/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/Treat-Streets/treat-streets-be/tree/main)

![GraphQL](https://img.shields.io/badge/GraphQl-E10098?style=for-the-badge&logo=graphql&logoColor=white)


## Installation

1. Clone this directory to your local repository using the SSH key:

```

$ git clone git@github.com:Treat-Streets/treat_streets_be.git

```

2. Install gems for development using Bundler:

```

$ bundle install

```

3. Set up database:

```

$ rails db:{drop,create,migrate,seed}

```

4. Run test suite:

```

$ bundle exec rspec

```

5. Set up Application.yml:

```

$ bundle exec figaro install

```

6. Inside your Application.yml:


```
MAPQUEST_KEY: <Mapquest key> 
```
&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://developer.mapquest.com/">Get Key Here »</a>

```
YELP_API_KEY: <Yelp key>
```

&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.yelp.com/developers/documentation/v3/authentication">Get Key Here »</a>



7. Run your local development server:

```

$ rails s

```



## GraphQL Example responses and requests
### Query Locations
Retrieves all locations in the database. Listed are all the attributes that can be requested.
A minimum of one attribute of the locations must be requested in the query.

Request
```
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
```
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

### Create Location
#### Successful Request
Request
```
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
```
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
#### Failed Request
Addresses are checked for validity. If an incorrect street address, city, or state 
are entered no location will be created in the database.

Bad Request - The incorrect city is given for this street address
```
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
```
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

### Get coordinates from zipcode
#### Successful Request
Request
```
{
    coordinates (zipcode: "80111"){
        latitude
        longitude
        errors
    }
}
```
Response
```
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
#### Failed Request
Zipcodes are validated to check for correct length and that they only contain integers.

Bad Requests
```
{
    coordinates (zipcode: "8011"){
        latitude
        longitude
        errors
    }
}
```
```
{
    coordinates (zipcode: "80d11"){
        latitude
        longitude
        errors
    }
}
```
Response
```
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
 
