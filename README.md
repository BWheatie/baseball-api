[![Build Status](https://travis-ci.org/BWheatie/baseball-api.svg?branch=master)](https://travis-ci.org/BWheatie/baseball-api)
[![Code Climate](https://codeclimate.com/github/BWheatie/baseball-api/badges/gpa.svg)](https://codeclimate.com/github/BWheatie/baseball-api)
[![Test Coverage](https://codeclimate.com/github/BWheatie/baseball-api/badges/coverage.svg)](https://codeclimate.com/github/BWheatie/baseball-api/coverage)

Baseball API
============

Introduction
---------------
This API uses an open source historical database curated by Sean Lehman. In its current state the api renders statistics present in Battings, Pitching, Fielding, and corresponding post season tables. It also includes personal info for each player from the Players table. It is currently in use at [here](http://betterthanmostsports.com). The project was inspired by a love of baseball and a desire to see statistics presented in a visually challenging way.

###Getting Started

##Dependancies
  *Ruby 2.2.2
  *Postgresql

##Installing
  *Clone repo
  *Run `script/setup`
  *[Import Database](http://seanlahman.com/files/database/lahman-sql_2015-01-24.zip
  *Run `script/server` to run migrations and get server started for local development