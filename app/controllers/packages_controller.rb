class PackagesController < ApplicationController
  def index
    require "date"

    @today = Date.current

    matching_packages = Package.all

    @list_of_packages = matching_packages.order({ :created_at => :desc })

    @list_of_arriving_packages = @list_of_packages.where({ status: nil })
    @list_of_delivered_packages = @list_of_packages.where({ status: "true" })

    render({ :template => "packages/index.html.erb" })
  end

  def create
    the_package = Package.new
    the_package.content = params.fetch("query_content")
    the_package.status = params.fetch("query_status")
    the_package.user_id = params.fetch("query_user_id")

    if the_package.valid?
      the_package.save
      redirect_to("/", { :notice => "Package created successfully." })
    else
      redirect_to("/", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.content = params.fetch("query_content")
    the_package.status = params.fetch("query_status")
    the_package.user_id = params.fetch("query_user_id")

    if the_package.valid?
      the_package.save
      redirect_to("//#{the_package.id}", { :notice => "Package updated successfully."} )
    else
      redirect_to("//#{the_package.id}", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.destroy

    redirect_to("/", { :notice => "Package deleted successfully."} )
  end
end
