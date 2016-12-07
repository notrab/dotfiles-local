# Dotfiles

These are the dotfiles that I use.

I highly recommend using the Thoughtbot laptop & dotfiles to get started.

* [thoughtbot/laptop](https://github.com/thoughtbot/laptop)
* [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)

You'll find my dotfiles hook into their configuration.

# Scripts

### New Rails app with a custom generator.
```bash
new-rails-app [name]
```

If you want to run the generator directly without using my dotfiles. You can.

```bash
rails new [name] -m https://raw.githubusercontent.com/notrab/dotfiles-local/master/rails/template.rb
```

### New express app using babel
```bash
new-express-babel-starter [name]
```
