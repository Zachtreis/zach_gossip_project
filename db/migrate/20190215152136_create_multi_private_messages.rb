class CreateMultiPrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :multi_private_messages do |t|
      t.references :recipient, index: true
      t.belongs_to :private_message

      t.timestamps
    end
  end
end
