class CreateInsurance < ActiveRecord[5.1]
  def change
    create_table :insurance do |t|
      t.string :state
      t.float :carpremiumsdollar
      t.float :insurancelossesperdriver
    end
  end
end
