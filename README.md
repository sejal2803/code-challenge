# Code Challenge

Welcome to the Main Street code challenge. This repository includes a very basic rails app to be used to assessment and testing purposes only.

## Getting Started

Dependencies:

- Rails 6 (Framework)
- Postgres (For Database)
- Node (For Webpacker / Rails Dependencies)

This repository has a `bin/setup` script that should get things up and running for the majority of users if you have the above dependencies installed.

From the root of the project directory - simply run:

`bin/setup`

Once that runs you should be able to run the following 2 commands in separate terminal tabs / windows:

1.  `rails s` - this will start the rails server locally.
2.  `bin/webpack-dev-server` - this will start to watch and recompile the JavaScripts found in `app/javascript`
