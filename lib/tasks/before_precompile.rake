task :build_frontend do
  sh 'npm install'
  sh 'npm run release'
end

Rake::Task['assets:precompile'].enhance(%i(build_frontend))
