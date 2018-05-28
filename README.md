
# Application Engineer Interview Exercise - Ilana Corson

## Directions from Applicant: Ilana Corson

## Heroku

- The application is deployed [here](https://fathomless-ocean-38421.herokuapp.com/).

## Setup

- To get started, at the root of this directory, enter the command `bundle` from the command line to install all relevant gems.
- To get the database, run `rails db:migrate` at the root of the directory.

## Tests

- To run the test suite, you will need a environment variable keys. For ease and because this is a private repository, I have provided these keys for you:

```
GITHUB_CLIENT_ID: 681455f47bae023a36d6
GITHUB_CLIENT_SECRET: 8897d8ef485545209e1917443d724f41213bf36f
GITHUB_TOKEN: 6ee2ddf5e85cab52c6ba0e29aae87fba8764ec5b
```

- You will want to add these keys to your environment in a file that does not get pushed up to GitHub. I recommend using the gem figaro as it is already installed in this repository. To use figaro in this application, run `bundle exec figaro install` from the root of the project and it will create a `application.yml` file and add it to your `.gitignore` file.
- To run the test suite, run the command `rspec` at the root of the project from the terminal.

## Comments

- This was the first time I worked with GraphQL and found it extremely user friendly. It was nice to get all of the data back with one call to the API and not have to retrieve the information through multiple calls. I have a lot of previous experience with the V3 standards. That being said, I made an API call to the v3 version to get the activity feed because I could not find accessible documentation on how to access it via GraphQL.
- There is some view related logic in the plain old ruby objects and I struggled to find a good place for them. My next step would be to refactor into some sort of presenter object.
- I used a SimpleDelegator object to keep the users methods in tact while allowing other methods. This greatly reduced the use of instance variables in the view.

# Challenge

## Welcome

Hi, and thanks for applying for the __Application Engineer__ position with the GitHub Developer Marketing team.

This exercise is designed to give you an opportunity to show off programming skills that would be relevant to work on [GitHub Classroom](https://classroom.github.com) ([source](https://github.com/education/classroom)).

## Exercise instructions

Please use this repository to develop a simple [Ruby on Rails](http://rubyonrails.org) application that allows a user to log in with GitHub. Once authorized, the application should display the public profile information and persist the `access_token`. You should make sure to always display up-to-date profile information.

You can find all the information you need about the GitHub API on the [GitHub Developer](https://developer.github.com/) site.

## Evaluation

Your submission will be evaluated against the following criteria:

* Meets the stated requirements
* Code is high quality, well organized, and secure
* Best practices are followed including:
  * Version control
  * Iterative development
  * Automated testing
  * Build scripts

## Submission

To submit your work, please deploy your application to [Heroku](https://heroku.com) using the free tier and email your recruiter a link to your production application along with a link to this repository.
