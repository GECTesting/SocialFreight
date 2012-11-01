class Nick < ActiveRecord::Base

  belongs_to :nicknamed, polymorphic: true

  default_scope { where(patron_id: Patron.current_id) }
  
  def self.log(target, slug, patron_id)
  	clean_slug = slug.to_s.parameterize.downcase.gsub("-", "")
  	#TODO check new nick, if it exists
    nick = Nick.new(nicknamed: target, name: clean_slug, patron_id: patron_id)
    nick.save
    
    nick
  end

  def token_inputs
    { name: name }
  end

  #private
  #def nick_exists(nickname, patron_id)
    
  #end

end