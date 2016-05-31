require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test 'not valid without note' do
    refute Entry.new(date: Time.zone.today, author: 'test').valid?,
           'Not valid without note'
  end

  test 'not valid without author' do
    refute Entry.new(date: Time.zone.today, note: 'something').valid?,
           'Not valid without author'
  end

  test 'not valid without date' do
    refute Entry.new(note: 'something', author: 'test').valid?,
           'Not valid without date'
  end

  test 'text search' do
    assert Entry.text_search('something').to_sql, 'should return something'
  end
end
