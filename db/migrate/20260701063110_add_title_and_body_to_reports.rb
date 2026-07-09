class AddTitleAndBodyToReports < ActiveRecord::Migration[8.0]
  def change
    add_column :reports, :title, :string
    add_column :reports, :body, :text
  end
end
