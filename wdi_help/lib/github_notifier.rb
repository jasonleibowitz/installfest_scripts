require 'github_api'
require 'io/console'
require 'yaml'

class GithubNotifier
  attr_reader :client, :username, :owner, :repo, :data, :homework

  def initialize
    config = File.join(ENV['HOME'], '.wdi-installfest/wdi_help/config/github.yaml')
    settings = YAML::load(File.open(config))
    @username = settings['USERNAME']
    @repo     = settings['CLASS_REPO']
    @owner    = settings['WDI_OWNER']
    @homework = settings['HOMEWORKLEAD']
    @client   = Github.new({
          :basic_auth => "#{username}:#{password}",
          :user       => username,
          :repo       => repo
        })
  end

  def alert(message = "Out Sick")
    new_issue = {
      "assignee" => homework,
      "body"     => "",
      "labels"   => [ "absence"],
      "title"    => message
    }
    client.issues.create(new_issue)
  end

  def password
    print "Github Password: "
    STDIN.noecho(&:gets).chomp
  end
end