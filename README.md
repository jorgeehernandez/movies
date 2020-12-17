# Tolkien Cimena

This is a solution proposed for a simple Cinema Restful based system. It was created using clean architure :). 

![alt text](https://drive.google.com/uc?export=view&id=1VXUzDeVxCFvmVg4760FRneeURJWSStIU)

## To run

In the root folder run:

    $ bundle install

And then execute:

    $ bundle exec rackup


## Usage


Create movie

    curl --location --request POST 'http://localhost:9292/api/movies' \
    --header 'Content-Type: application/json' \
    --data-raw '{
        "name" : "Galadriel",
        "description" : "Galadriel : The neya ring bearer",
        "image_url" : "this is a url",
        "dates" : ["2019-09-10"]
    }'

Get all movies

    curl --location --request GET 'http://localhost:9292/api/movies' \
    --header 'Content-Type: application/json'

Create  a reservation

    curl --location --request POST 'http://localhost:9292/api/reservations/' \
    --header 'Content-Type: application/json' \
    --data-raw '{
        "movie_id" : 1608162468,
        "date" : "2019-10-10",
        "persons" : 5
    }'
    

Get all reservations

    curl --location --request GET 'http://localhost:9292/api/reservations/' \
    --header 'Content-Type: application/json' 
    
Get reservations by dates 

    curl --location --request GET 'http://localhost:9292/api/reservations/?date_from=2019-01-10&date_to=2021-12-10' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Basic ZWR3aW52OmVkd2luMTA1Mg=='

## Future work

Room to improve

- Error handling
- Field Validations
- Security
- Name files
