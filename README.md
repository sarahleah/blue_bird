bluebird - Full-Stack Web Application
======================================

A social app created on Sinatra with Ruby, JavaScript, and HTML. 

**See it live at: https://morning-caverns-79562.herokuapp.com/**

* [Technologies](#technologies-used)
* [Approach](#approach)
* [Features](#features)
* [Lessons Learned](#lessons-learned)
* [Setup](#setup)
* [Unsolved Problems](#unsolved-problems)
* [Future Additions](#future-additions)

Technologies used:
------------------

* Ruby
* HTML
* CSS
* Cloudinary photo storage API
* JavaScript

Approach:
---------

I started this project off by drawing a set of wireframes diagramming the connections to other pages and the databases. Using that, I started building out the core functionality by making my utility and database functions. Once those were tested, I used my own experience of using the website to build out features. When the base product was functioning as I wanted, I began styling it, I added JS for effects and forms, and added Cloudinary integration.

Here's a link to the initial wireframes I did: https://drive.google.com/file/d/1hUVexC3BV_F0zr68QicOTCBN5T2trE2T/view?usp=sharing

Features: 
---------

- Create-Read-Update-Delete app for post and user resources
- Responsive design

Lessons Learned:
----------------

The biggest lesson that I learned during this project was to focus on taking small steps towards the larger goal. Going into this project I felt quite overwhelmed by the seeming complexity of transferring data between requests and the database, but I found that the project went extremely smoothly and easily when I just focussed on the next logical step. 

Setup: 
------

To run this project, download the source code here, or see it live here: https://morning-caverns-79562.herokuapp.com/

Unsolved Problems:
------------------
- There is currently no data validation in the forms, it simply checks that there is data. 
- Because of the way the images are cropped, the quality of them is decreased. I would like to learn more about the Cloudinary api to fix this problem. 
- When a user is signed in but hasn't posted, they can't change their profile photo or password.

Future Additions: 
-----------------

I would like to add:
* Delete user option that deletes all the users posts from the database as well. 
* Comments and likes between users.
