class UserRoles < ActiveRecord::Migration[7.0]
  def change
    safety_assured do
      create_table :user_roles do |t|
        t.references :role, null: false, foreign_key: true
        t.references :user, null: false, foreign_key: true

        t.timestamps
      end
    end

  end
end
