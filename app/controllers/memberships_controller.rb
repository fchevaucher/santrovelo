class MembershipsController < ApplicationController
  before_action :set_member, only: [:new, :create]
  before_action :set_membership, only: [:destroy]

  # GET /memberships/new
  def new
    @membership = @member.memberships.build
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = @member.memberships.build(membership_params)

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership.member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to member_url(@membership.member), notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    def set_member
      @member = Member.find(params[:member_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:fee)
    end
end