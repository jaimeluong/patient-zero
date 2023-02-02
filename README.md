# Patient Zero

Patient Zero is a full-stack app built with Rails 7 for medical professionals to manage patient records and for patients to schedule appointments.

This app supports CRUD operations on providers, patients, and appointments. It uses Bootstrap through cssbundling-rails for the views as well as the Devise gem for authentication to log in and out and authorization to certain operations via an admin role. Data is stored in a PostgreSQL database.

- **Ruby version:** 3.1.2

- **Rails version:** 7.0.4.2

- **System dependencies:** Ruby, Rails, PostgreSQL, Bootstrap, Devise, cssbundling-rails

## To run

Make sure you have npm and Yarn installed in addition to the required dependencies.

App will be viewable at [localhost](http://localhost:3000/) and ran on port 3000.

```
$ git clone git@github.com:jaimeluong/patient-zero.git
$ rails s
```