class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :set_cluster
  before_action :authenticate_user!
  # GET /links
  # GET /links.json
  def index
    @links = @cluster.links.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = @cluster.links.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = @cluster.links.new(link_params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to cluster_links_path, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params[:link])
        format.html { redirect_to cluster_links_path, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:link])
    end
    def set_cluster
      @cluster = Cluster.find(link_params[:cluster_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.permit(:cluster_id, :link=>[:url, :description, :weighting])
    end
end