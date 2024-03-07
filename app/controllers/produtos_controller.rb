class ProdutosController < ApplicationController
  def index
    @produtos=Produto.order(nome: :desc).limit 2
    @produto_com_desconto=Produto.order(:preco).limit 1
  end
  def create
    values= params.require(:produto).permit(:nome,:descricao,:preco,:quantidade)
    @produto=Produto.new values
    if @produto.save
      redirect_to root_url
    else
      render :new
      end
  end

  def new
    @produto = Produto.new
  end
  def destroy
    id= params[:id]
    Produto.destroy(id)
    redirect_to root_path
  end
  def busca
    @nome=params[:nome]
    @produtos= Produto.where "nome like ?","%#{@nome}%"
  end
end
