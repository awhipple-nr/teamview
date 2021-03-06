# TeamView

TeamView is a simple, straightforward Rails application built to help track and educate on diverse and fluid engineering and product-focused teams.  An API is provided for access outside the product organization.

Each team page contains:

* Why a team exists, who they typically interact with, and how they operate
* Standard communication channels
* Members

A manually updated stoplight legend (green, yellow, red) allows fast determination of the reliability/completeness of the information for each team.


##Using:
Rails 4.2.5

MySql must be installed - edit database.yml as necessary

Basic tests use Rspec


##To use:##

###Local setup:

```
git clone https://github.com/lhkpdx/teamview.git

cd teamview

bundle

rake db:create db:migrate db:seed
```


##API:

###API Access

There is currently no authentication necessary to perform standard CRUD operations.

###Endpoints

The following resources are available for index and CRUD operations:

```
/api/teams
/api/team/(params[:id])
```

###API Requests

Requests for the teamview API are all RESTful, with parameters following the endpoint path. Each request in the documentation is displayed with the appropriate HTTP method and sample parameters. The following request using HTTP GET requests all team objects: http://localhost:3000/api/teams?

The index is sorted on team name

###CRUD Requests


Create, update and delete requests follow standard RESTful practices. While some fields are available on a resource, you may not be able to set values such as created_at during a CREATE, UPDATE or DELETE action. The allowed parameters are listed at the beginning of each CRUD section.

##Create a new Team [POST]

Create, update and delete requests follow standard RESTful practices. While some fields are available on a resource, you may not be able to set values such as created_at during a CREATE, UPDATE or DELETE action. The allowed parameters are listed at the beginning of each CRUD section.

##Create a new Team [POST]


**The following attributes are permitted when creating a Team.  All other attributes will be ignored.**

|Field	|Type |Required	|Notes  
|-------|-----|---------|------
name |`string` | **Yes**
name |`string` | **Yes**
andon |	`integer `|**Yes**  |   limited to 0 = "green", 1 = "yellow", 2 = "red"
members | `text ` | No	|
charter | `text ` | No	|
vision | `text ` | No	|
mission | `text ` | No	|
mission_tests | `text ` | No	|
success_criteria | `text ` | No	|
responsibilities | `text ` | No	|
accounting_code | `text ` | No	|
jira_project_key | `text ` | No	|
email | `string ` | No	| limited to @newrelic.com domain
slack_channel | `string ` | No	|
slack_channel | `string ` | No	|
