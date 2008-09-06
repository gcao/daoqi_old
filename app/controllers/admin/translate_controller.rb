class Admin::TranslateController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  #layout :admin
  def index    
    @view_translations = ViewTranslation.find(:all, :conditions => [ 'built_in IS NULL AND language_id = ?', Locale.language.id ], :order => 'text')
  end

  def translation_text
    @translation = ViewTranslation.find(params[:id])
    render :text => @translation.text || ""  
  end

  def set_translation_text
    @translation = ViewTranslation.find(params[:id])
    previous = @translation.text
    @translation.text = params[:value]
    @translation.text = previous unless @translation.save
    render :partial => "translation_text", :object => @translation.text  
  end
end
