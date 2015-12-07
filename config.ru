# This file is used by Rack-based servers to start the application.

# Unicorn self-process killer
require 'unicorn/worker_killer'

# Max requests per worker
max_request_min =  ENV['UNICORN_MAX_REQUEST_MIN'].to_i || 3072
max_request_max =  ENV['UNICORN_MAX_REQUEST_MAX'].to_i || 4096
use Unicorn::WorkerKiller::MaxRequests, max_request_min, max_request_max

# Max memory size (RSS) per worker
oom_min = ((ENV['UNICRON_OOM_MIN'].to_i || 192) * (1024**2))
oom_max = ((ENV['UNICRON_OOM_MAX'].to_i || 256) * (1024**2))
use Unicorn::WorkerKiller::Oom, oom_min, oom_max

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
