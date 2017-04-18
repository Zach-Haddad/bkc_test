# Ben Kinney Companies Code Sample

[Live](https://bkcsample.herokuapp.com/)

### Overview

This is a simple message board application made with Ruby on Rails with a PostgreSQL database and styled with Bootstrap.  User authentication was implemented with Devise as per the assignment.  Posts and Comments have basic CRUD functionality, allowing users to make posts and comments and edit/delete their own entries.  I utilized eager loading (i.e. ActiveRecord #includes) to avoid n+1 queries when fetching comments for each post.  Simple unit tests, validation/association checks were written with RSpec and test for the Sign Up process was written with Capybara.  

### Future Features
- [ ] Work on implementing Devise sign-in/sign-up views with Bootstrap modals
- [ ] Pagination for posts, comments
