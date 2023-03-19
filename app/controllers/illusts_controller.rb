class IllustsController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @illusts = Illust.all
      search = params[:search]
      @illusts = @illusts.joins(:user).where("body LIKE ?", "%#{search}%") if search.present?
      @illusts = @illusts.page(params[:page]).per(3)
    
      if params[:tag]
        Tag.create(name: params[:tag])
      end
      
    end
    
    def new
      @illust = Illust.new
    end
    
    def show
      @illust = Illust.find(params[:id])
      @commentis = @illust.commentis
      @commenti= Commenti.new
    end
   
    def create
      illust = Illust.new(illust_params)
      illust.user_id = current_user.id
      if illust.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end
   
    def edit
      @illust = Illust.find(params[:id])
    end
   
    def update
      illust = Illust.find(params[:id])
      if illust.update(illust_params)
        redirect_to :action => "show", :id => illust.id
      else
        redirect_to :action => "new"
      end
    end
   
    def destroy
      illust = Illust.find(params[:id])
      illust.destroy
      redirect_to action: :index
    end
  
    private

    def illust_params
      params.require(:illust).permit(:body, :image, tag_ids: [])
    end

end