require "erb"
class MenuItem
  attr_accessor :label, :event_type, :onclick, :enable, :icon, :icon_hover
  attr_reader :internal_id 

    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::PrototypeHelper
    include ActionView::Helpers::JavaScriptHelper 
    include ERB::Util

  def initialize(label="",options={})
      @label=label
      @event_type=options[:event_type]
	  @onclick=options[:onclick]
      @enable=options[:enable]           
      @icon=options[:icon]
	  @icon_hover=options[:icon_hover]
       
	  @internal_id = "item#{self.object_id.abs}"
      @event_type||=:link
	  @enable||=true if options[:enable].nil? || options[:enable] == true           

  end

  def link_to(name, options = {}, *parameters_for_method_reference)
         @onclick="#{url_formater(options,parameters_for_method_reference)}"
         @label=name
         @event_type=:link
         self
   end

   def link_to_remote(name, options = {}, html_options = {})
            
            @controller=options[:base]
            options.delete :base
            @request=@controller.request
            @label=name
            @event_type=:code
            @onclick=remote_function(options)
            self
   end
  
   def to_s
      "new menuItem(\"#{@label}\", \"#{@internal_id}\", \"#{@event_type}:#{@onclick}\",#{@enable})"
   end
   
   def MenuItem.separator
       MenuItem.new("-")  
   end
   
   private
   
   def url_formater(options,parameters_for_method_reference)
          if options.is_a? Hash
              begin 
                 @controller=options[:base]
                 options.delete :base
                 @request=@controller.request
              rescue => e
                   options="Instance of controller not fould"
              end
          end
          
         options.is_a?(String) ? options : url_for(options, *parameters_for_method_reference)
   end
   
  
end
