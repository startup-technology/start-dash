# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :redis_store, Settings.session_store.to_h
