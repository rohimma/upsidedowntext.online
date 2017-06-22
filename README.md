<p align="center">
  <a href="https://about.gitlab.com/" target="_blank"><img src="https://img.shields.io/badge/Developed%20on-Private%20GitLab-red.svg?style=flat&maxAge=3600" alt="Developed on Private GitLab"></a>
  <a href="https://github.com/rohimma/upsidedowntext.online" target="_blank"><img src="https://img.shields.io/badge/Mirrored%20to-GitHub-lightgrey.svg?style=flat&maxAge=3600" alt="Mirrored to GitHub"></a>
</p>

<img src="https://raw.githubusercontent.com/rohimma/upsidedowntext.online/master/resources/assets/images/homepage.PNG" />

#### Goal of the project
The goal of the project is to learn some basics about docker, for that i needed a simple project to start with..
But i didn't need to think long for what i should make, the moment i saw <a href="https://tweetfleet.slack.com/messages/@craqgerbil" target="_blank">@craqgerbil's</a> username i knew i had to make an app for that.

#### API
yes, there will be an api service for this (will work on that after the docker image).

### Dev env setup
1. `docker-compose up --build`  
2. `docker exec -it [website_phpfpm container id] /bin/bash`
3. `composer install`
4. `npm install`
5. `npm run dev`
6. `chown www-data:www-data -R storage bootstrap/cache`
7. `cp .env.example .env`
8. `php artisan key:generate`
9. `php artisan config:cache`

inspiration from <a href="https://tweetfleet.slack.com/messages/@craqgerbil" target="_blank">@craqgerbil</a> on <a href="https://tweetfleet.slack.com/" target="_blank">#tweetfleet</a>