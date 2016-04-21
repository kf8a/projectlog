require 'textacular/searchable'

class Entry < ActiveRecord::Base
  acts_as_taggable_on :categories

  validates :note, :date, :author

  mount_uploaders :attachments, AttachmentUploader

  extend Searchable(:date, :note, :author)

  def self.text_search(query)
    if query.present?
      words = query.split(/\s/)
      advanced_search words.join('|')
    else
      all
    end
  end
end
