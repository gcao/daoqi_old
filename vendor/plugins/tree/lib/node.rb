require 'instanceoptions'
require 'erb'
class Node  
  DEFAULT_OPTIONS={
    :label=> "Click Here",
    :url =>"#",
    :title => '',
    :target  => '',
    :icon  => '',
    :icon_open  => '',
    :event_name  => 'href', 
    :open => true,
    :parent => '',
    :id => '',
    :link_to_remote => nil,
    :link_to => nil
  }
   
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::JavaScriptHelper 
  include ERB::Util
  include InstanceOptions  
  
  def initialize(options={},html_options={},&block)
    @nodes=[]
    @options=options
    instance_options(DEFAULT_OPTIONS)
    @id=options[:id] || self.object_id.abs 
    if options[:link_to_remote]
      internal_link_to_remote(@label,options[:link_to_remote] , html_options)
    end
    
    if options[:link_to]
      internal_link_to(@label,options[:link_to] , *html_options.to_a)
    end
    block.call(@nodes) if block
  end
   
  def <<(node)
    @nodes << node
  end
  def id
          
    return @id || self.object_id.abs
         
  end
  
  def child(options={},html_options={})
       
    case options
    when Node
      @nodes << options
    when Hash
      n=Node.new(options,html_options)
      yield n if block_given?
      self.child(n)
      return n
    else 
      raise Exception.new("Unknow arguments #{node.class}")
    end
  end
  
   
  def internal_link_to(name, options = {}, *parameters_for_method_reference)
   
    @url="#{url_formater(options,parameters_for_method_reference)}"
    @label=name
         
         
  end
  
  def internal_link_to_remote(name, options = {}, html_options ={})
    @controller=options[:base]
    options.delete :base
    @request=@controller.request
    @label=name
    @event_name='onclick'
    @url=remote_function(options)
  end
  
  def nodes
    if block_given? 
      yield @nodes
    else
      @nodes
    end
  end 
  def size
    @nodes.size
  end
  def to_s
   
    @nodes.to_s
  end          
   
  private
   
  def url_formater(options,parameters_for_method_reference)
    if options.is_a? Hash
      begin 
        @controller=options[:base]
        options.delete :base
        @request=@controller.request
      rescue => e
        options="Controller not found #{e}"
      end
    end
    options.is_a?(String) ? options : url_for(options, *parameters_for_method_reference)
  end
   
end