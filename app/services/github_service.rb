# frozen_string_literal: true

# service for grabbind data from github
class GithubService
  def initialize(user)
    @user = user
  end

  def repos
    getting_json('repos')
  end

  def followers
    getting_json('followers')
  end

  def following
    getting_json('following')
  end

  private

  def getting_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.github.com/user/') do |faraday|
      faraday.basic_auth(@user.username, @user.github_token)
      faraday.adapter Faraday.default_adapter
    end
  end
end
