# WebChat


## Technologies:

* Ruby 2.6.3
* Rails 6.1.5
* Redis


### Setup

Navigate to directory where the code script is located

```sh
$ cd ~/Fonix/web_chat
```
Install the dependencies and devDependencies.Run Following command after navigating to directory.

```sh
$ rvm use 2.6.3
````

```
$ bundle install
```

```
$ gem install mailcatcher
```

```
$ gem install redis
```

```
$ bundle exec wheneverize
```

```
whenever --update-crontab
```




### Steps to run Application

Start the sidekiq server
```sh
$ /Fonix/web_chat/ bundle exec sidekiq
```

Start the rails server
```sh
$ /Fonix/web_chat/ rails s
```


