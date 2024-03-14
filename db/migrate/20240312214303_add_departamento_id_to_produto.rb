class AddDepartamentoIdToProduto < ActiveRecord::Migration[7.1]
  def change
    add_column :produtos, :departamento_id, :integer
  end
end
