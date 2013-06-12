class AddLoanProvenance < ActiveRecord::Migration
  def up
    execute 'INSERT INTO provenances (name) VALUES (\'Loan\')'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
