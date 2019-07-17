class AddUsernameToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :user_name, :string
  end
end
