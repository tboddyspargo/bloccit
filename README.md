# Bloccit

This web application is a reddit-styled forum site written in Ruby on Rails. Bloccit users can contribute to a variety of conversation topics. Members vote on the relevance of each post so that current trends are apparent to all users.

![Landing page](https://tboddyspargo.github.io/img/bloccit_landing1.png)

# Ruby on Rails

Rails made creating the data models easy by handling the object relational model (ActiveRecord) and abstracting away the SQL interactions with the database. Using rails command-line utilities, I created the full spectrum of interaction with the data with very simple commands, generating URL routes and corresponding controller actions, test files, html templates, object classes and their attributes. Here are the objects that are involved in Bloccit:

| Object | Attributes | Description |
|--------|------------|-------------|
|User|name<br/>email<br/>password<br/>role|User objects allow Bloccit members to have access to appropriate information and identify themselves as contributers. Rails scoping is used to ensure users can only perform certain actions based on their role and their relationship to the content.|
|Topic|name<br/>description<br/>public|Topics can be created to categorize posts (discussions) to easily find what you're looking for.|
|Post|title<br/>body|Posts are individual conversations that fall into topic categories.
|Comment|body|User can participate in post conversations by commenting on them.|
|Vote||Users can vote on posts so that they rank higher in the topic's feed.|
|Favorite||The favorite object represents a relationship between a user and a post so that users can keep track of new activity on posts that interest them.|

![Thanksgiving 2017 topic page](https://tboddyspargo.github.io/img/bloccit_topic1.png)

# RSpec

The tests for Bloccit are written using the RSpec framework, which greatly facilitates writing concise, almost natural-language tests. I followed the principles of Test Driven Development (TDD) to write Bloccit, which meant that the tests came first. Writing the tests first helped me be very intentional about each distinct piece of functionality BEFORE its code even existed. It also helps ensure that as I continued to modify and re-organize the code I didn't loose track of everything that could be affected: if the tests started failing, I found out quickly and was able to correct any mistakes with much more ease.

![Post form](https://tboddyspargo.github.io/img/bloccit_newpost1.png)

# FactoryBot

Factories are code controllers that allow you to generate instances of objects in your code en masse. This can facilitate creating seed data of specific types for tests. FactoryBot (fka 'FactoryGirl') is a library that facilitates this, making it easy to describe factories for the types of objects in your project.

# Mailer

Bloccit includes automated notification features that are provided by using an `ActionMailer`. This mailer can be triggered by actions and send emails to relevant parties. For example, Bloccit will email any users who have favorited a post if someone comments on it. This allows members to stay in the loop and participate in real-time to updates on a conversation.

![Post page](https://tboddyspargo.github.io/img/bloccit_post1.png)

# Heroku

The production Bloccit environment is hosted by a free version of [Heroku](https://www.heroku.com)'s dynamos. When not in use these computational units, perhaps best compared with 'containers' power down when not in use, so the first user after a period of inactivity may experience a short delay before Bloccit responds.

# Run Application
Either visit the application that's [hosted by Heroku](https://limitless-scrubland-98400.herokuapp.com), or run it locally by executing this command:

```bash
$> rails s
```
