require "rack"
require "active_record"
require "yaml"

module RbSilly
  class App
    def call(env)
      req = Rack::Request.new(env)

      case req.path
      when "/"
        [ 200, { "content-type" => "text/plain" }, [ "Hello World" ] ]
      else
        [ 404, { "content-type" => "text/plain" }, [ "404" ] ]
      end
    end
  end

  def self.application
    @application ||= App.new
  end

  def self.init
    db_config = YAML.load_file("config/database.yml", aliases: true)
    ActiveRecord::Base.establish_connection(db_config["development"])
  end
end
