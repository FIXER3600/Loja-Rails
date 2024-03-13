class ProdutosController < ApplicationController
  def index
    @produtos=Produto.order(nome: :desc).limit 2
    @produto_com_desconto=Produto.order(:preco).limit 1
  end
  def create
    values= params.require(:produto).permit(:nome,:descricao,:preco,:quantidade,:departamento_id)
    @produto=Produto.new values
    if @produto.save
      flash[:notice]="Produto criado com sucesso!"
      redirect_to root_url
    else
      render :new
      end
  end

  def new
    @produto = Produto.new
    @departamentos=Departamento.all
  end
  def destroy
    id= params[:id]
    Produto.destroy(id)
    flash[:notice]="Produto deletado com sucesso!"
    redirect_to root_path
  end
  def edit
    id= params[:id]
    @produto=Produto.find(id)
    @departamentos=Departamento.all
    render :new
  end
  def update
    id= params[:id]
    @produto=Produto.find(id)
    values= params.require(:produto).permit(:nome,:descricao,:preco,:quantidade,:departamento_id)
    @produto=Produto.new values
    if @produto.update values
      flash[:notice]="Produto atualizado com sucesso!"
      redirect_to root_url
    else
      @departamentos=Departamento.all
      render :new
    end
  end
  def busca
    @nome=params[:nome]
    @produtos= Produto.where "nome like ?","%#{@nome}%"
  end
end
