class AddAttachmentsToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :attachments, :json
  end
end
