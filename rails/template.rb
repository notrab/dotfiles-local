project_name = File.basename(__dir__)

run "rm README.md"

gem 'sidekiq'
gem 'haml-rails'

uncomment_lines 'Gemfile', /gem 'redis'/

after_bundle do
  # generate(:controller, "pages", "home")
  route %Q(root to: "pages#home")

  initializer "sidekiq.rb", <<-EOF
Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.secrets.redis_url, namespace: "sidekiq_#{project_name}"}
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.secrets.redis_url, namespace: "sidekiq_#{project_name}"}
end
  EOF

  application do
    <<-EOF
config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    config.active_job.queue_adapter = :sidekiq
  EOF
  end

  file "Procfile", <<-EOF
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -q default -q mailers
  EOF

  git :init
  git add: "."
  git commit: %Q{-m 'Initial commit'}
end
