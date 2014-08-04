class DocsController < ApplicationController
  before_action :set_doc, only: [:show, :edit, :update, :destroy]
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /docs
  # GET /docs.json
  def index
    @docs = Doc.all
  end

  # GET /docs/1
  # GET /docs/1.json
  def show
  end

  # GET /docs/new
  def new
    @doc = Doc.new
    @ad = Ad.new
  end

  # GET /docs/1/edit
  def edit
  end

  # POST /docs
  # POST /docs.json
  def create
    @doc = Doc.new(doc_params)
    @doc.create_ad(ad_params)
    @doc.ad.user_id = current_user.id

    respond_to do |format|
      if @doc.save && @doc.ad.save
        format.html { redirect_to docs_path, notice: 'Doc was successfully created.' }
        format.json { render :show, status: :created, location: @doc }
      else
        format.html { render :new }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docs/1
  # PATCH/PUT /docs/1.json
  def update
    respond_to do |format|
      if (@ad.user_id == current_user.id) && @doc.update(doc_params) && @ad.update(ad_params)
        format.html { redirect_to docs_path, notice: 'Doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @doc }
      else
        format.html { render :edit }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.json
  def destroy
    @doc.destroy if @ad.user_id == current_user.id
    respond_to do |format|
      format.html { redirect_to docs_url, notice: 'Doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc
      @doc = Doc.find(params[:id])
    end

    def set_ad
      @ad = @doc.ad
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_params
      params.require(:doc).permit(:doc_type, :doc_code, :first_name, :last_name)
    end

    def ad_params
      params.require(:ad).permit(:title, :city, :street, :date, :description)
    end
end
