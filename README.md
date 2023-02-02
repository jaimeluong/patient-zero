# Patient Zero

Patient Zero is a full-stack app built with Rails 7 for medical professionals to manage patient records and for patients to schedule appointments.

This app supports create, read, update, and delete (CRUD) operations on providers, patients, and appointments. Bootstrap, installed and loaded with cssbundling-rails, is used to style the views. Devise is implemented for authentication, forcing users to sign-in before accessing any pages, and for authorization via an admin role with special privileges. All data is stored in a PostgreSQL database on my local machine.

- **Ruby version:** 3.1.2

- **Rails version:** 7.0.4.2

- **System/gem dependencies:** Ruby, Rails, PostgreSQL, Bootstrap, Devise, cssbundling-rails

## Run application

Make sure you have npm and Yarn installed in addition to the required dependencies listed above.

```
$ git clone git@github.com:jaimeluong/patient-zero.git
$ cd patient-zero
$ rails s
```

App will be viewable at [localhost](http://localhost:3000/) and hosted on port 3000.

## Notes

- Rails uses Test::Unit as the default testing framework. When I generated this project, I opted to skip tests with the -T flag allowing for RSpec to be used instead.

- Planning to deploy on Heroku web services soon.