class SessionsController < Devise::SessionsController

  def new
    @search = Item.search(params[:q])
    @items = @search.result.paginate(:page => params[:page], :per_page => 10)       

    super    
  end

  def create
    @search = Item.search(params[:q])
    @items = @search.result.paginate(:page => params[:page], :per_page => 10)       
  
    super
  end
end
