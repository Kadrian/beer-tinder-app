# beer-tinder-app
Lets Markus evaluate beers in tinder style <br/>
Deployed at www.markus-trinkt.de <br/>
www.markus-trinkt.de/statistics shows how often he has voted in favor or against a beer!

# Setup
```
bundle install
bundle exec ruby beer-tinder-app.rb
```

If you want to test with a mobile device inside your network:
```
bundle exec ruby beer-tinder-app.rb -o 0.0.0.0
```

## With automatic reload
```
gem install rerun
rerun 'beer-tinder-app.rb' -i '**/*.yml'
```

# TODO
1.) Drink all the beers!!!1!1
