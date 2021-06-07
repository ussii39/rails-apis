class CompanyController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
    protect_from_forgery 
    def index
        company = Company.all
        render json: { status: 'SUCCESS', message: 'Loaded companys', data: company }
    end

    def show
         
        # filter = @company.select{|com| com[:users_id] == @users_id}
        filter = Company.where(:users_id => @users_id)
        render json: { status: 'SUCCESS', message: 'Loaded the post', data: filter }
        # byebug
    end

    def create
        # company = Company.create(name: 'ussii', address: 'setagaya', users_id:1)
        company = Company.new(self.company_params)
        if company.save
          render json: { status: 'SUCCESS', data:  company }
        else
          render json: { status: 'ERROR', data:  company.errors }
        end
    end

    def update
        # c = Company.where(:id => @users_id)
        if @company_id.update(company_params)
          render json: { status: 'SUCCESS', message: 'Updated the company', data: @company_id }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @company.errors }
        end
      end

    private
    def set_post
        @users_id = params[:id]
        @company_id = Company.where(:id => @users_id) 
        @companies = Company.all
    end

    def company_params
        params.permit(:name, :users_id, :address)
    end
end

