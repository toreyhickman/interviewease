#InterviewEase
> Conduct remove technical interviews in your browser.

<http://www.interviewease.herokuapp.com/>

Created by:

- [Torey Hickman](https://github.com/toreyhickman)
- [Andrew McGregor](https://github.com/andmcgregor)
- [Rick Thomas](https://github.com/agentutah)

##About

InterviewEase aims to make remote technical interviews easy. Companies can sign up, add employees and create challenges for future candidates to solve. Once an interview is set up, simply email or read the interview code over the phone and you can start instantly. The interview involves an employee control panel, a live code editor, video and audio from both people and the ability to run any code you create (Ruby only at the moment).

Made as a Dev Bootcamp Final Project from Wednesday July 24 to Thursday August 1, 2013

##Screenshot

![InterviewEase](/interviewease.png)

##Install

- Fork the repo and clone the files onto your local machine:

      $ git clone https://github.com/andmcgregor/interviewease.git

- Navigate to the application directoy in terminal and run **bundle install** to gather the required gems:

      $ bundle install

- Depending on your local development environment, you may need to create and save out a **.ruby-gemset** and/or **.ruby-version** dot file(s) within the main application directory to configure your gemset and ruby version. Use the provided .ruby-version.sample and .ruby-gemset.sample files as a guide.

- Set environment variables

- A server should be set up which can run ruby files (our server used rvm) and allows connection via SSH with a username and password (we used a modified ubuntu install on an ec2 server).

AWS_HOST: <server address>
AWS_USER: <server username>
AWS_PASS: <server password>

- You also need to register an account to use the [Pusher API](http://pusher.com/)

APP_ID: <pusher app id>
KEY: <pusher key>
PUSHER_KEY: <pusher key>
SECRET: <pusher secret>

- Launch the application server:

      $ rails s

- Open a broswer and navigate to localhost:3000

- Enjoy

##Usage

To be added.

##Final Thoughts

Thanks to Dev Bootcamp for structuring the program in a way which allowed us the freedom to use the technical skills acquired over the 8 weeks leading up to this project to build InterviewEase.

- We didn't get around to implementing all the functionality we initally planned. Making the employees, topics and challenges resources more CRUD-like is something we would like to implement in the future.
- Fix security issues involved with running ruby code on a server. Things to consider would be restricting network access and file reading/writing, prevention of infinate loops, and auto-detection if a server is compromised and a task to load up a fresh ec2 instance.
- Add the ability to run code against Rspec rather than just driver code.
- Improve the overall UI/UX.

===

Last Updated: Summer 2013