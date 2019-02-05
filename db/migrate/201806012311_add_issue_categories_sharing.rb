class AddIssueCategoriesSharing < ActiveRecord::Migration
  def self.up
    unless column_exists?(:issue_categories, :sharing, :string)
      add_column :issue_categories, :sharing, :string, :default => 'none', :null => false
      add_index :issue_categories, :sharing
    end
  end

  def self.down
    remove_index :issue_categories, :sharing
    remove_column :issue_categories, :sharing
  end
end
