class CatalogController < ApplicationController
  def view
  	@name = params[:product_name]
  	@brand = params[:brand_name]
  end
end
