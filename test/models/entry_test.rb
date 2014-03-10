require 'test_helper'

class EntryTest < ActiveSupport::TestCase

  test 'not valid without note' do
    assert Entry.new(date: Date.today, author: 'test').valid? == false
  end

  test "not valid without author" do
    assert Entry.new(date: Date.today, note: "something").valid? == false
  end

  test "not valid without date" do
    assert Entry.new(note: "something", author: "test").valid? == false
  end

  test 'text search' do 
    assert Entry.text_search('something').to_sql == "Select * from entries where date @@ 'something' or note @@ 'something"
  end
  # test "the truth" do
  #   assert true
  # end
end
