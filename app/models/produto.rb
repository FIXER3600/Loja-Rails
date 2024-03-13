class Produto < ApplicationRecord
  validates :preco,presence:true
  belongs_to :departamento,optional: true
  validates :nome,presence:true,length: {in:2..200}
  validates :descricao,presence:true,length: { in: 5..200 }
  validates :quantidade,numericality: { only_integer: true },presence:true
end
