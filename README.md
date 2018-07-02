## Heroku

- The application is deployed [here](https://fathomless-ocean-38421.herokuapp.com/).

## Setup

- To get started, at the root of this directory, enter the command `bundle` from the command line to install all relevant gems.
- To get the database, run `rails db:migrate` at the root of the directory.

## Tests

- To run the test suite, you will need a environment variable keys. If you would like those keys, please contact me.

- To run the test suite, run the command `rspec` at the root of the project from the terminal.

## Comments

- This was the first time I worked with GraphQL and found it extremely user friendly. It was nice to get all of the data back with one call to the API and not have to retrieve the information through multiple calls. I have a lot of previous experience with the V3 standards. That being said, I made an API call to the v3 version to get the activity feed because I could not find accessible documentation on how to access it via GraphQL.
- There is some view related logic in the plain old ruby objects and I struggled to find a good place for them. My next step would be to refactor into some sort of presenter object.
- I used a SimpleDelegator object to keep the users methods in tact while allowing other methods. This greatly reduced the use of instance variables in the view.

## What is it?

This application allows a user to log in with GitHub. Once authorized, the application should display the public profile information and persist the `access_token`. 
