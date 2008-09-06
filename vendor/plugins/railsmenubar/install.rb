require "fileutils"

RAILS_ROOT="../../../" unless defined? RAILS_ROOT
sourcedir="#{RAILS_ROOT}/vendor/plugins/railsmenubar"
 
%w(/public/javascripts/jsdomenu.js /public/javascripts/jsdomenubar.js /public/stylesheets/jsdomenubar.css /lib/menu.rb /lib/menu_bar.rb /lib/menu_item.rb).each do |f|
  FileUtils.cp("#{sourcedir}#{f}", "#{RAILS_ROOT}#{f}")
end

FileUtils.mkdir_p("#{RAILS_ROOT}/public/images/jsdomenubar") unless File.exist? "#{RAILS_ROOT}/public/images/jsdomenubar"
FileUtils.cp(Dir.glob(sourcedir+'/public/images/jsdomenubar/*.*') , "#{RAILS_ROOT}/public/images/jsdomenubar")
