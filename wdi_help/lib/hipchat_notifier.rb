require 'hipchat'

class HipchatNotifier
  attr_accessor :client, :classroom, :hipchat_username
  
  def initialize
    config = File.join(ENV['HOME'], '.wdi-installfest/wdi_help/config/hipchat.yaml')
    settings = YAML::load(File.open(config))
    @client = HipChat::Client.new(settings['API_TOKEN'])
    @classroom = settings['CLASSROOM']
    @hipchat_username = settings['USERNAME']
  end

  def self.levels(hash)
    hash.each do |method, value|
      define_method(method) do |message|
        client[classroom].send(hipchat_username, message, color: value)
      end
    end
  end

  levels  :danger  => :red, 
          :warn    => :yellow, 
          :say     => :purple, 
          :success => :green
end