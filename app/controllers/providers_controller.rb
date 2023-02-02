class ProvidersController < ApplicationController
    # Only allow users with admin role to view and access these resources
    before_action :authenticate_user!

    def index
        unless current_user.admin?
            render "forbidden"
        end
        @providers = Provider.all

        respond_to do |format|
            format.html
            format.json {
                render :json => @providers
            }
        end
    end

    def show
        unless current_user.admin?
            render "forbidden"
        end
        @provider = Provider.find(params[:id])

        respond_to do |format|
            format.html
            format.json {
                render :json => @provider
            }
        end
    end

    def new
        unless current_user.admin?
            render "forbidden"
        end
        @provider = Provider.new
    end

    def create
        @provider = Provider.new(provider_params)

        if @provider.save
            redirect_to @provider
            flash[:saved] = "Created a new provider"
        else
            flash.now[:error] = "Something went wrong"
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        unless current_user.admin?
            render "forbidden"
        end
        @provider = Provider.find(params[:id])
    end

    def update
        @provider = Provider.find(params[:id])

        if @provider.update(provider_params)
            redirect_to @provider
            flash[:updated] = "Updated details for provider"
        else
            flash.now[:error] = "Something went wrong"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @provider = Provider.find(params[:id])
        @provider.destroy

        flash[:destroyed] = "Provider removed"
        redirect_to root_path
    end

    private

    def provider_params
        params.require(:provider).permit(:first_name, :last_name, :position)
    end
end
