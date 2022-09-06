# README



## JSON Schema
### Query Locations
```
{
  "data": {
    "queryLocation": [
      {
        "street_address": "123 Fake Street"
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
```

## GraphQL Example responses and requests
### Query Locations
Retrieves all locations in the database. Listed are all the attributes that can be requested.
A minimum of one attribute of the locations must be requests in the query.

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
                "image": "n/a",
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
                "image": "n/a",
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
                "image": "Nope",
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
Adderesses are checked for validity. If an incorrect street address, city, or state 
are entered no location will be created in the database.

Bad Request
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
