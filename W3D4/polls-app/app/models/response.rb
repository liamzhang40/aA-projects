# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer          not null
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'byebug'

class Response < ApplicationRecord

  validate :respondent_already_answered?
  validate :author_answer_own_pull?

  belongs_to :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id

  belongs_to :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  has_one :question,
    through: :answer_choice,
    source: :question



  def sibling_responses
    # self.question.responses.where.not(answer_choice_id: self.answer_choice_id, user_id: self.user_id)
    self.question.responses.where.not(id: self.id)
  end

  # private
  def respondent_already_answered?
    unless self.sibling_responses.where(user_id: self.user_id).empty?
      errors[:message] << 'You already answered this question'
    end
  end

  def author_answer_own_poll?
    if self.question.poll.author.id == self.user_id
      errors[:message] << 'You can\'t answer to your own poll'
    end
  end

end
