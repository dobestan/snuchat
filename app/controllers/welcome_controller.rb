class WelcomeController < ApplicationController
  # Home ( root_path )
  def index
  end

  # About Page
  def about
  end

  # Help Page
  def help
    @faqs = Faq.all
    @proposals = Proposal.where(answer: false)
  end
end
