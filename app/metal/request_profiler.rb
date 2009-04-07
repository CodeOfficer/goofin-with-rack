# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class RequestProfiler
  
  def initialize(app)
    @app = app
  end
  
  def self.call(env)
    env['TIME_NOW'] = Time.now.to_s
    
    body = env.map do |key, value| 
      Rack::Utils.escape_html("#{key}=#{value}")
    end.join("<br/>\n")
    
    if env["PATH_INFO"] =~ /^\/request_profiler/
    # if env["PATH_INFO"] =~ /^(.)*/
      [ 200, 
        { "Content-Type" => "text/html",
          "Content-Length" => body.length.to_s}, 
        [body]
      ]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
  
  
      # 
      # def call(env)
      #   response = @app.call(env)
      #   tail_log
      #   response
      # end
  
end
