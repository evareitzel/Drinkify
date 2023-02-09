# Drinkify

Drinkify is an application where mixologists can share their drink recipes.

This application was built for Flatiron's Software Engineering Bootcamp Phase 3 Project.

Introductory video: 
[https://vimeo.com/797490708]
(https://vimeo.com/797490708)

## Getting started

[**Fork and clone**] this repository to get started. Then from the backend directory, run `bundle install` to install the gems.

### Frontend

```console
$ cd app-client 
$ npm start
```

### Backend

```console
$ cd app-server
$ bundle exec rake server
```

- If processes are already running on the server:
```console
$ killall -9 ruby
```

- You can start your server with:

```console
$ bundle exec rake server
```

This will run your server on port
[http://localhost:9292](http://localhost:9292).

### API Endpoints
- [http://localhost:9292/mixologists]
  (http://localhost:9292/mixologists)
- [http://localhost:9292/drinks]
  (http://localhost:9292/drinks)

## Introduction

This project's **Sinatra API backend** (app-server) uses **Active Record** to access and persist data in a database, which is used by a separate **React frontend** (app-client) that interacts with the database via the API. The models use a one-to-many relationship between the mixologists and drinks tables. Application routes (both client-side and backend) follow RESTful conventions.

## Sinatra Backend API
Each drink _belongs to_ a mixologist and each mixologist _has many_ drinks. This project uses the following API routes in Sinatra:
  - Create and Read actions for the mixologist model (has_many)
    - **Create** a new mixologist
    - **Read** a list of mixologists
 
  - Full CRUD capability for the drink model (belongs_to)
    - **Create** a new drink
    - **Read** each mixologist's list of drinks
    - **Update** an individual drink
    - **Delete** a drink

OO design patterns:
- separate classes for each model

Optimal backend functionality:
- Passes JSON for related associations to the frontend from the backend
- Uses active record methods in the controller to grab data from the database and provide as JSON to the frontend

## React Frontend
The React frontend application interacts with the API to perform CRUD actions. It utilizes proper front end state management, updating state using a setState function after receiving fetch responses from POST, PATCH, and DELETE requests.

## Resources
- [create-react-app](https://create-react-app.dev/docs/)
- [The Cocktail DB](https://www.thecocktaildb.com/)
