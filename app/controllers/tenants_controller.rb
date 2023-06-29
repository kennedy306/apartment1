class TenantsController < ApplicationController

        before_action :set_tenant, only: [:show, :update, :destroy]
    
        def index
          tenants = Tenant.all
          render json: tenants
        end
    
        def show
          render json: @tenant
        end
    
        def update
          if @tenant.update(tenant_params)
            render json: @tenant
          else
            render json: { error: @tenant.errors.full_messages.join(', ') }, status: :unprocessable_entity
          end
        end
    
        def destroy
          @tenant.destroy
          head :no_content
        end
    
        private
    
        def set_tenant
          @tenant = Tenant.find(params[:id])
        end
    
        def tenant_params
          params.require(:tenant).permit(:name, :age)
        end
      end         


