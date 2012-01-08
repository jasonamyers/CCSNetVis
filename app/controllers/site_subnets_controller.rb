class SiteSubnetsController < ApplicationController
  # GET /site_subnets
  # GET /site_subnets.json
  def index
    @primary_site_subnets = SiteSubnet.where(:site_id => 1).all
    @secondary_site_subnets = SiteSubnet.where(:site_id => 2).all
    @site_subnets = SiteSubnet.where("site_id > ?", 2).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_subnets }
    end
  end

  # GET /site_subnets/1
  # GET /site_subnets/1.json
  def show
    @site_subnet = SiteSubnet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_subnet }
    end
  end

  # GET /site_subnets/new
  # GET /site_subnets/new.json
  def new
    @site_subnet = SiteSubnet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_subnet }
    end
  end

  # GET /site_subnets/1/edit
  def edit
    @site_subnet = SiteSubnet.find(params[:id])
  end

  # POST /site_subnets
  # POST /site_subnets.json
  def create
    @site_subnet = SiteSubnet.new(params[:site_subnet])

    respond_to do |format|
      if @site_subnet.save
        format.html { redirect_to @site_subnet, notice: 'Site subnet was successfully created.' }
        format.json { render json: @site_subnet, status: :created, location: @site_subnet }
      else
        format.html { render action: "new" }
        format.json { render json: @site_subnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_subnets/1
  # PUT /site_subnets/1.json
  def update
    @site_subnet = SiteSubnet.find(params[:id])

    respond_to do |format|
      if @site_subnet.update_attributes(params[:site_subnet])
        format.html { redirect_to @site_subnet, notice: 'Site subnet was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_subnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_subnets/1
  # DELETE /site_subnets/1.json
  def destroy
    @site_subnet = SiteSubnet.find(params[:id])
    @site_subnet.destroy

    respond_to do |format|
      format.html { redirect_to site_subnets_url }
      format.json { head :ok }
    end
  end
end