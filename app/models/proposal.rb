class Proposal < ActiveRecord::Base
  belongs_to :parameter_detail
  belongs_to :user
  belongs_to :proposal_status

  accepts_nested_attributes_for :parameter_detail
  after_initialize :init

  scope :by_status, lambda { |proposal_status| where(:proposal_status_id => proposal_status.id)}
  scope :for_user, lambda { |user| where(:user_id => user.id)}

  def init
    self.parameter_detail ||= ParameterDetail.new
    self.proposal_status ||= ProposalStatus.new_status
  end

end
