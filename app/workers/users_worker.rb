class UsersWorker
  include Sidekiq::Worker

  def perform(*)
    api_key = Rails.application.credentials.api_key
    getUsers(api_key, 0, 7)
  end

  def getUsers(key, offset, limit)
    loop do
      url = "https://microverse-api-app.herokuapp.com/users?offset=#{offset}&limit=#{limit}"
      response = RestClient.get url, { :Authorization => key }
      json = JSON.parse response
      p json
      populateUsers(json)
      break if json.length < limit
      p "Offset value: #{offset}"
      offset += limit
    end
  end

  def populateUsers(users)
    users.each do |user|
      if User.check_id(user['id'])
        User.create(index: user['id'], first_name: user['first_name'], last_name: user['last_name'],
        status: user['status'], email: user['email'], created_at: user['created_at'])
      end
    end
  end
end
