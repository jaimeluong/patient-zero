class ProvidersController < ApplicationController
    def index
        @providers = Provider.all

        respond_to do |format|
            format.html
            format.json {
                render :json => @providers
            }
        end
    end

    def show
        @provider = Provider.find(params[:id])

        respond_to do |format|
            format.html
            format.json {
                render :json => @provider
            }
        end
    end

    def new
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