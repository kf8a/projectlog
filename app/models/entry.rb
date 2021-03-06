# frozen_string_literal: true

require 'textacular/searchable'

# an entry in the log usually just text
class Entry < ApplicationRecord
  acts_as_taggable_on :categories

  validates :note, :date, :author, presence: true

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
