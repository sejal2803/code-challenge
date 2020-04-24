class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :create, :new]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
  end

  def edit
  end

  def destroy
    if @company.destroy
      redirect_to companies_path, notice: "Company Deleted"
    else
      redirect_to company_settings_path(@company), alert: "Could not delete"
    end
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: "Changes Saved"
    else
      render :edit
    end
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Saved"
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:companies_company).permit(
      :name,
      :legal_name,
      :full_address,
      :zip_code,
      :phone,
      :email,
      :owner_id,
      :google_analytics_id,
      :color
    )
  end

  def set_company
    @company = Company.friendly.
      includes(
        :hero,
        :owner_detail,
        :services,
        :values,
        :appeals
      ).
      find(params[:id])
  end

  def set_owners
    @owners = Users::User.with_role(:owner).unarchived
  end

end
