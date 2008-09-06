require "menu_item"
require "menu"

class MenuBar

  attr_accessor :width, :height, :div_id, :style_class
  attr_reader :internal_id, :menus
  

  def initialize(options={},html_options={})
      @internal_id = "menuBar#{self.object_id.abs}"
      @width=options[:width].to_i
	  @height=options[:height]
      @div_id=options[:div_id]
	  @style_class=options[:style_class]
      @html_options=html_options
      
	  @height||=14 
      @div_id||=@internal_id
	  @style_class||="jsdomenubardiv"
      @menus=[]
      yield self if block_given?
  end

  def <<(*menu)

      @menus.concat menu
  end
  def format_html(h)
     ret=""
     h.each do |k,v|
              ret+=" #{k}=\"#{v}\""
     end
     
      ret
  end

  def to_s
			code="#{@menus.join("")}\n"
         code+="#{@internal_id} = new jsDOMenuBar('static','#{@div_id}', false, '#{@style_class}',#{@width},#{@height});\n"
         @menus.each do |m|
             code+="#{@internal_id}.addMenuBarItem(new menuBarItem('#{m.label}',#{m.internal_id}));\n";
         end

      return "<script>function createjsDOMenu#{@internal_id}(){ #{code}\n}</script><div id='#{@div_id}' #{format_html(@html_options)}><script> setTimeout('createjsDOMenu#{@internal_id}()',300); </script></div>"
      
  end

  def new(label,width=200)
        m=Menu.new(label,width)
        yield m if block_given?
        self << m
        m

  end 


end
