# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# initial setup - in place: rails 6.0.2.1 app with ruby 2.7.0; configured middleware; configured devise; configured devise-jwt in devise.rb; migrations for user table; using login,logout,signup for defaults;

Blacklist
In this strategy, a database table is used as a blacklist of revoked JWT tokens. The jti claim, which uniquely identifies a token, is persisted. The exp claim is also stored to allow the clean-up of staled tokens.
- add model
- add table
- add include Devise::JWT::RevocationStrategies::Blacklist in model
- in user model, add jwt_revocation_strategy: JwtBlacklist