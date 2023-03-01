class RolifyCreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table(:roles, id: :tinyint, auto_increment: true) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_roles, id: false) do |t|
      t.references :user
      t.integer :role_id, limit: 1
    end

    create_table(:staffs_roles, id: false) do |t|
      t.references :staff
      t.integer :role_id, limit: 1
    end
    
    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:users_roles, [ :user_id, :role_id ])
    add_index(:staffs_roles, [ :staff_id, :role_id ])
  end
end
