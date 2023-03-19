class CommentisController < ApplicationController
    before_action :authenticate_user!

    def create
      illust = Illust.find(params[:illust_id])
      commenti = illust.commentis.build(commenti_params) #buildを使い、contentとillust_idの二つを同時に代入
      commenti.user_id = current_user.id
      if commenti.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      end
    end
  
    def destroy
        commenti = Commenti.find(params[:id])
        commenti.destroy
        redirect_to action: :show
      end
    
    private
  
      def commenti_params
        params.require(:commenti).permit(:content)
      end
end