class Rapidfire::RolesController < ApplicationController
  before_action :set_rapidfire_role, only: [:show, :edit, :update, :destroy]

  # GET /rapidfire/roles
  # GET /rapidfire/roles.json
  def index
    @rapidfire_roles = Rapidfire::Role.all
  end

  # GET /rapidfire/roles/1
  # GET /rapidfire/roles/1.json
  def show
  end

  # GET /rapidfire/roles/new
  def new
    @rapidfire_role = Rapidfire::Role.new
  end

  # GET /rapidfire/roles/1/edit
  def edit
  end

  # POST /rapidfire/roles
  # POST /rapidfire/roles.json
  def create
    @rapidfire_role = Rapidfire::Role.new(rapidfire_role_params)

    respond_to do |format|
      if @rapidfire_role.save
        format.html { redirect_to @rapidfire_role, notice: 'Role was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rapidfire_role }
      else
        format.html { render action: 'new' }
        format.json { render json: @rapidfire_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rapidfire/roles/1
  # PATCH/PUT /rapidfire/roles/1.json
  def update
    respond_to do |format|
      if @rapidfire_role.update(rapidfire_role_params)
        format.html { redirect_to @rapidfire_role, notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rapidfire_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rapidfire/roles/1
  # DELETE /rapidfire/roles/1.json
  def destroy
    @rapidfire_role.destroy
    respond_to do |format|
      format.html { redirect_to rapidfire_roles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rapidfire_role
      @rapidfire_role = Rapidfire::Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rapidfire_role_params
      params.require(:rapidfire_role).permit(:name)
    end
end
