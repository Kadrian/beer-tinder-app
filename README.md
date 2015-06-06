# beer-tinder-app
Lets Markus evaluate beers in tinder style <br/>
Deployed at www.markus-trinkt.de <br/>
www.markus-trinkt.de/statistics shows how often he has voted in favor or against a beer!

# Setup
bundle install <br/>
bundle exec ruby beer-tinder-app.rb

## With automatic reload
gem install rerun <br/>
rerun beer-tinder-app.rb

# How to deploy
ssh biertind@markus-trinkt.de <br/>
(Password: 62e15803ce591051b228e ) <br/>
bash deploy.sh

# TODO
1.) Save the current beer index so Markus doesn't have to start evaluating from the beginning every time he clicks statistics.<br/>
