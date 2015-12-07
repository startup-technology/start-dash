namespace 'db' do
  desc 'reset development database'
  task 'reset_all' do
    unless Rails.env.development?
      abort 'This task can be executed in only development'
    end
    %w(db:drop db:create db:migrate
       db:seed_fu db:test:prepare).each do |task|
      puts "Excecuting task #{task}\n"
      Rake::Task[task].invoke
    end
  end
end
