# frozen_string_literal: true

module Admin
  # UsersController
  class UsersController < Admin::ApplicationController
    include Pagination

    def index
      @search = User.ransack(query)
      @users = @search.result(distinct: true)
                      .page(page)
                      .per(per_page)
                      .order(order)

      respond_to do |format|
        format.html
      end
    end

    def show
      @user = User.find(params[:id])

      respond_to do |format|
        format.html
      end
    end
  end
end
