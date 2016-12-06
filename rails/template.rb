uncomment_lines 'Gemfile', /gem 'redis'/

gem 'sidekiq'
gem 'haml-rails'

after_bundle do
  initializer "sidekiq.rb", <<-EOF
Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDIS_URL"], namespace: "sidekiq"}
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDIS_URL"], namespace: "sidekiq"}
end
EOF

  application do <<-EOF
config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]

    config.active_job.queue_adapter = :sidekiq
EOF
  end

  file "Procfile", <<-EOF
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -q default -q mailers
EOF

  file "Procfile.local", <<-EOF
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -q default -q mailers
redis: redis-server
EOF

  file "scripts/server", <<-EOF
#!/bin/sh

heroku local -f Procfile.local
EOF

  git :init
  git add: "."
  git commit: %Q{-m 'Initial commit'}

  run 'heroku create'
  run 'heroku addons:create heroku-redis:hobby-dev'
  run "rm README.md"
end
