class AddAttachmentsToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :attachments, :string, array: true, default: []
  end
end
