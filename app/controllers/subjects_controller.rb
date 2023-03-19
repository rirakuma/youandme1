class SubjectsController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @subjects = Subject.all
      search = params[:search]
      @subjects = @subjects.joins(:user).where("body LIKE ?", "%#{search}%") if search.present?
      @subjects = @subjects.page(params[:page]).per(10)

      if params[:tag]
        Tag.create(name: params[:tag])
      end
      
    end

    def new
        @subject = Subject.new
    end

    def show
        @subject = Subject.find(params[:id])  
        @comments = @subject.comments
        @comment = Comment.new

      end

    def create
        subject = Subject.new(subject_params)

        subject.user_id = current_user.id 
        
        if subject.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def edit
        @subject = Subject.find(params[:id])
      end

      def update
        subject = Subject.find(params[:id])
        if subject.update(subject_params)
          redirect_to :action => "show", :id => subject.id
        else
          redirect_to :action => "new"
        end
      end
      
      def destroy
        subject = Subject.find(params[:id])
        subject.destroy
        redirect_to action: :index
      end
      
    private

    def subject_params
      params.require(:subject).permit(:body, tag_ids: [])
    end
end

