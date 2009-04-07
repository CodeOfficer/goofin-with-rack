# links

# http://www.pathf.com/blogs/2009/02/its-only-rack-on-rails-but-i-like-it/
# http://guides.rails.info/rails_on_rack.html
# http://github.com/koshigoe/rackup_examples/tree/master
# http://github.com/rtomayko/rack-contrib/tree/master
# http://thewebfellas.com/blog/2008/12/22/flash-uploaders-rails-cookie-based-sessions-and-csrf-rack-middleware-to-the-rescue
# http://soylentfoo.jnewland.com/articles/2008/12/16/rails-metal-a-micro-framework-with-the-power-of-rails-m
# http://www.nofluffjuststuff.com/blog/rick__denatale/2009/03/rails_and_rack_it_s_the_modularity_.html?utm_source=blogitem&utm_medium=rss&utm_campaign=blogrss

# http://daniel.collectiveidea.com/blog/2008/4/9/git-submodules
# http://edspencer.net/2008/04/git-clone-vs-git-submodule.html
 
class MyProfiler
  
  def initialize app
    @app = app
  end
  
  def call env
    
    # return Rack::Response.new("Missing Shit!").finish if !env["slidingstats"]
    
    status, headers, response = @app.call(env)
    
    profile = env.map do |key, value| 
      Rack::Utils.escape_html("#{key}=#{value}")
    end.join("<br/>\n")
    
    [ 200, 
      { "Content-Type" => "text/html",
        "Content-Length" => (response.body.length + profile.length).to_s}, 
      ["#{response.body}" + profile]
    ]

    # @app.call(env)
    
  end
  
end
  # 
  # 
  # 
  # def self.call(env)
  #   env['TIME_NOW'] = Time.now.to_s
  #   
  #   body = env.map do |key, value| 
  #     Rack::Utils.escape_html("#{key}=#{value}")
  #   end.join("<br/>\n")
  #   
  #   if env["PATH_INFO"] =~ /^\/request_profiler/
  #   # if env["PATH_INFO"] =~ /^(.)*/
  #     [ 200, 
  #       { "Content-Type" => "text/html",
  #         "Content-Length" => body.length.to_s}, 
  #       [body]
  #     ]
  #   else
  #     [404, {"Content-Type" => "text/html"}, ["Not Found"]]
  #   end
  # end