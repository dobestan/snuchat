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
      flash[:success] = "건의사항이 성공적으로 등록되었습니다."
      redirect_to help_path
    else
      # Failed
      render 'new'
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
    redirect_to help_path
  end

  private
    def proposal_params
      params.require(:proposal).permit(:title, :content)
    end
end
