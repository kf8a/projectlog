class Entry < ActiveRecord::Base
  acts_as_taggable_on :categories

  validates_presence_of :note

  def self.text_search(query)
    if query.present?
      where("note @@ :q", q: query)
    else
      scoped
    end
  end


end
