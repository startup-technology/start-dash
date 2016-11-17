# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :redis_store, servers: ENV['REDIS_URL'], expire_after: 1.day
