# Members Only

A simple Ruby on Rails app demonstrating authentication with Devise.

Users can create posts. Logged-in members can see the author of each post, while guests can only see the content.

## Features

* Authentication with Devise
* Users can sign up and log in
* Members can create posts
* Author names visible only to signed-in users

## Setup

```bash
git clone https://github.com/PratiAmalden/members-only
cd members-only
bundle install
rails db:migrate
rails server
```

Visit: [http://localhost:3000](http://localhost:3000)

## Credits

Built as part of The Odin Project curriculum.