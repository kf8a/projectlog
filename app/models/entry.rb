class Entry < ActiveRecord::Base
  acts_as_taggable_on :categories

  validates_presence_of :note

  def self.text_search(query)
    if query.present?
      where("to_char(date, 'YYYY-MM-DD') @@ :q or note @@ :q", q: query)
    else
      scoped
    end
  end


end
