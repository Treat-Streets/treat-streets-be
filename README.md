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
        "zip": "12345"
        "lat":  1.234
        "long": 1.234
        "type": "Apt"
        "scariness": 
          {
           "description": "How scary the decorations are"
           "type": "Number"
           "minimum": 0
           "maximum": 10
          }
        "description": string
        "start": tbd/datetime
        "end": tbd/datetime
        "img": string
      }
    ]
  }
}

