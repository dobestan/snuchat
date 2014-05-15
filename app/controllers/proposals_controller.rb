class ProposalsController < ApplicationController
  before_action :active_user, only: [:new, :create]
  before_action :admin_user, only: [:reply, :update_reply]

  # New Proposal
  # Available for Signed In Users
  def new
  end

  def create
    @user = current_user

    @proposal = Proposal.new(proposal_params)
    @proposal.user_id = @user.id

    if @proposal.save
      # Success
      redirect_to proposal_path
    else
      # Failed
      redirect_to proposal_path
    end
  end

  # Reply to Proposals
  # Available only for admin users
  def reply
    @proposal = Proposal.find(params[:proposal_id])
  end

  def update_reply
    @user = current_user
    @proposal = Proposal.find(params[:proposal_id])

    @answer = Proposal.new(proposal_params)
    @answer.user_id = @user.id
    @answer.answer = true
    @answer.save

    @proposal_relationship = ProposalRelationship.create(proposal_id: @proposal.id,
                                                         answer_id: @answer.id)
    redirect_to proposal_path
  end

  def destroy
    @proposal = Proposal.find(params[:proposal_id])
    @proposal.destroy
    redirect_to proposal_path
  end

  private
    def proposal_params
      params.require(:proposal).permit(:content)
    end
end
