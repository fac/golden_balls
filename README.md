# What is this?
This is a game for Dev Dev based on the gameshow "Golden balls".
In the show, contestants work in pairs to earn money, but in the final round they have to choose between "share" or "steal". If both choose "split", they split the money. If one chooses "split" and the other "steal", the one who chose "steal" gets all the money. If both choose "steal", they both get nothing.

In this project, we'll play the last round with a twist.
Everyone will play everyone else, and themselves 1000 times.
Every time you play the same person, you'll be given the history of all the other rounds you've played together.

At the end we'll see who beat who, and who earned the most money overall.

# How to play
1. Clone the repo
2. Run `bundle install`
3. Create a file in the contests folder with your name `<your_name>.rb`
4. Add `Player.register("<your_name>") do |history| ... end`, you can see an example in `random.rb`
5. Implement your strategy in the block, you'll be given the history of all the games you've played with the other player.
6. Return either "share" or "steal" from the block.
7. Run `bundle exec rspec` to make sure it's all working.
8. Open a pull request, once we're all ready we'll see who the winner is!

# Details
The format of the history is an array of hashes in the order the turns occurred, like this:
```ruby
[
  {
    "<your_name>" => "share",
    "<their_name>" => "steal"
  },
  {
    "<your_name>" => "steal",
    "<their_name>" => "share"
  }
]
```

 - If you both choose "share", you both get 2 points.
 - If you both choose "steal", you both get 0 points.
 - If one chooses "share" and the other "steal", the one who chose "steal" gets 3 points, and the one who chose "share" gets 0 points.
