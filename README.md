# README
  <p align="center">
    <a href="https://treat-streets-fe.herokuapp.com/"><strong>Treat Streets - Heroku »</strong></a>
  </p>
  <p align="center">
    <a href="https://github.com/Treat-Streets/treat-streets-fe"><strong>Treat Streets - Front End Repo »</strong></a>
  </p>

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/Treat-Streets/treat-streets-be/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/Treat-Streets/treat-streets-be/tree/main)

# Query Houses

## JSON Schema
```
{
  "data": {
    "queryLocation": [
      {
        "city": "City"
        "state": "CO"
        "zipcode": "12345"
        "latitude":  1.234
        "longitude": 1.234
        "location_type": "Apt"
        "scariness": 
          {
           "description": "How scary the decorations are"
           "type": "Number"
           "minimum": 0
           "maximum": 10
          }
        "description": string
        "start_time": tbd/datetime
        "end_time": tbd/datetime
        "image": string
        "email": string
      }
    ]
  }
}


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

MAPQUEST_KEY: 'Mapquest key' <a href="https://developer.mapquest.com/">Get Key Here »</a>

YELP_API_KEY: 'Yelp key' <a href="https://www.yelp.com/developers/documentation/v3/authentication">Get Key Here »</a>

```

7. Run your local development server:

```

$ rails s

```

# Contributors

<table>

  <tr>
   <td align="center"><a href="https://github.com/tjhaines-cap"><img src="https://avatars.githubusercontent.com/u/60715457?v=4" width="100px;" alt=""/><br /><sub><b>Thomas H. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/thomas-haines-9b93451a0/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/devAndrewK/"><img src="https://avatars.githubusercontent.com/u/98759023?v=4" width="100px;" alt=""/><br /><sub><b>Andrew K. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/andrewkingdev/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/Tross0208"><img src="https://avatars.githubusercontent.com/u/46985513?v=4" width="100px;" alt=""/><br /><sub><b>Tyler R. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/tyler-ross-0b206122b/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/ASands17"><img src="https://avatars.githubusercontent.com/u/93043035?v=4" width="100px;" alt=""/><br /><sub><b>Amanda S. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/amanda-sands1/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/VictoriaFC"><img src="https://avatars.githubusercontent.com/u/98445902?v=4" width="100px;" alt=""/><br /><sub><b>Victoria F. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/victoria-fox-collis/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

   <td align="center"><a href="https://github.com/megschuetz"><img src="https://avatars.githubusercontent.com/u/98415017?v=4" width="100px;" alt=""/><br /><sub><b>Megan S. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/megan-schuetz/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>

    <td align="center"><a href="https://github.com/CorCanavan"><img src="https://avatars.githubusercontent.com/u/97919748?v=4" width="100px;" alt=""/><br /><sub><b>Corinne C. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/corinnecanavan/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>
  </tr>
</table>