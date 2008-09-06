require "menu_item"
class Menu

  attr_accessor :label, :width, :itens, :menus
  attr_reader :internal_id 
  

  def initialize(label,width=120)
       @label=label
       @width=width
	   @itens=[]
	   @menus={}
       @internal_id = "menu#{self.object_id.abs}"
       yield self if block_given?

  end 

  def <<(*itens)
		put(*itens)
  
  end
  def put(*itens)
		@itens.concat itens
  end

  def new(label,options={})
        mi=MenuItem.new(label, options) 
        menu=Menu.new("")
        yield menu if block_given?
        @menus[mi.internal_id]=menu
        @itens << mi
        menu

  end 
  
  def new_item(label="",options={})
        mi=MenuItem.new(label, options) 
        
        yield mi if block_given?
        @itens << mi
        mi
  end 

  def to_s
         icons=""
      	code="#{@internal_id} = new jsDOMenu(#{@width});\n"+
         "with (#{@internal_id}) {\n"
         
          @itens.each do |i|
              code+="\taddMenuItem(#{i});\n"
              
              icons+="icon_for(#{@internal_id}.items['#{i.internal_id}'],'#{i.icon}','#{i.icon_hover}');\n"  if i.icon || i.icon_hover
              #icons+="icon_for(#{@internal_id}.items.#{i.internal_id},'#{i.icon}','#{i.icon_hover}');\n"  if i.icon || i.icon_hover
          end

        code+="}\n"
        code+=icons         
 
        @menus.each do |k,v|

            code+="#{v}#{@internal_id}.items['#{k}'].setSubMenu(#{v.internal_id});\n"
        end
      code
  end

end
