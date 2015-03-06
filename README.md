## NonOfficeJobs
My capstone project for the Full Stack Web Development Boot Camp of Bloc.io to teach the fundamentals of web development and Rails 4.

NonOfficeJobs features Markdown-powered job wikis, sorted by category. Users can post (with images) and comment on them, as well as favorite jobs and posts. Users can view their activity feeds on their profile pages, and follow other users. Users can also create job listings for existing opportunities, list brainstorms for ideas they have of work that needs to be done in the world, and offer job mentorships for other users.

http://nonofficejobs.herokuapp.com/

#### Set-up
config/application.yml 
blank template: config/application.example.yml

#### Gems
* bootstrap-sass 3.1.1 - for styling

* devise - for user authentication

* figaro 1.0 - to securely store configuration values

* faker - to seed on development

* redcarpet - for Markdown

* pundit - for authorization

* pry - to debug on development

* carrierwave - for file uploading

* mini_magick - for image editing

* fog - Ruby cloud services library

* will_paginate 3.0.5 - adds pagination

* breadcrumbs_on_rails - adds breadcrumbs through the controller

* mailboxer - user messaging system