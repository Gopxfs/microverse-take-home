namespace :users do
  task fetch: :environment do
    UsersWorker.new.perform
  end
end
