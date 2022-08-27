# README

# Query Houses

## JSON Schema
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

