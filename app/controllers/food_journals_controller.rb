class FoodJournalsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    before_action :authorize!, only: [:edit, :update, :destroy]
    def new 
        @foodJournal = FoodJournal.new
    end

    def create

        @foodJournal = FoodJournal.new foodJournal_params
        @foodJournal.user = current_user
        
        if @foodJournal.save
            flash[:notice] = "Food Journal created successfully"
           
            redirect_to food_journal_path(@foodJournal)
          else
            
            render :new
          end

    end

    def show

    end

    
    def index

        @foodJournal = FoodJournal.all

    end


    def edit
        
    end


    def update 

       

        if @foodJournal.update foodJournal_params
            redirect_to food_journal_path(@foodJournal)
          else
            render :edit
          end
    end


    def destroy



        @foodJournal.destroy
        redirect_to food_journals_path
    end


    private


    def foodJournal_params

        params.require(:food_journal).permit(:title, :description, :before_sugar_lvl, :after_sugar_lvl, :tag_names)


    end

    def find_product
         @foodJournal = FoodJournal.find params[:id]
    end

    def authorize!
        redirect_to food_journal_path, alert: "access denied" unless can?(:crud, @foodJournal)
      end
end
