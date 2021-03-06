class Api::V1::GroupsController < ApplicationController
    before_action :authenticate_user!

    def index
        @groups = Group.all 
        render json: @groups  
    end 

    def create
        @group = Group.new(group_params)
        
        if @group.save 
            render json: {
                messages: 'group create', 
                is_messages: true, 
                data: { group: @group }
            }, status: :ok 
        else 
            render json: {
                messages: 'group failed', 
                is_messages: false, 
                data: {}
            }, status: :failed 
        end 
    end 

    def update 
        @group = Group.find(params[:id])
        if @group.save(group_params)
            render json: {
                messages: 'update success', 
                is_message: true, 
                data: { group: @group }
            }, status: :ok 
        else
            render json: {
                messages: 'update failed', 
                is_messages: false, 
                data: {}
            }, status: :failed 
        end    
    end 

    def destroy 
        @group.destroy 
    end 

    private 

    def set_group 
        @group = Group.find(params[:id])
    end 

    def group_params
        params.permit(:name, :desc)
    end 
end
