class DocsController < ApplicationController
  before_action :set_doc, only: [:show, :edit, :update, :destroy]
  before_action :set_ad, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @doc = Doc.new
    @ad = Ad.new
  end

  def edit
    authorize! :edit, @ad
  end

  def create
    @doc = Doc.new(doc_params)
    @doc.create_ad(ad_params)
    @doc.ad.user_id = current_user.id

    if @doc.save && @doc.ad.save
      redirect_to ads_docs_path, notice: 'Doc was successfully created.'
    else
      ender :new
    end
  end

  def update
      authorize! :edit, @ad
      if @doc.update(doc_params) && @ad.update(ad_params)
        redirect_to ads_docs_path, notice: 'Doc was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    authorize! :destroy, @ad
    @doc.destroy
    redirect_to ads_docs_url, notice: 'Doc was successfully destroyed.'
  end

  private

    def set_doc
      @doc = Doc.find(params[:id])
    end

    def set_ad
      @ad = @doc.ad
    end

    def doc_params
      params.require(:doc).permit(:doc_type, :doc_code, :first_name, :last_name)
    end

    def ad_params
      params.require(:ad).permit(:title, :city, :street, :date, :description)
    end
end
