require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    if @already_built_response
      raise "nooooooo"
    else
      res.status = 302
      res.header['location'] = url
      session.store_session(res)
    end

    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    if @already_built_response
      raise "nooooooo"
    else
      res['Content-Type'] = content_type
      res.write(content)
      session.store_session(res)
    end

    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    if @already_built_response
      raise "nooooooo"
    else
      dir = Dir.pwd
      target_dir = [
        Dir.pwd,
        "/views",
        "/#{self.class.name.underscore}",
        "/#{template_name}.html.erb"
      ].join
      content = File.read(target_dir)
      content = ERB.new(content).result(binding)
      render_content(content, 'text/html')
    end

    @already_built_response = true
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    
  end
end
