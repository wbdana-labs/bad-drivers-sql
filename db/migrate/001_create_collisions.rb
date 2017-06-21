class CreateCollisions < ActiveRecord::Migration[5.1]
  def change
    create_table :collisions do |t|
      t.string :state
      t.float :collisionbillionmiles
      t.float :percentagespeeding
      t.float :percentagealcohol
      t.float :percentagenotdistracted
      t.float :percentagenoprior
    end
  end
end
