# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord

  validates :text, presence: true

  belongs_to :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id

  has_many :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  # def results
  #   hash = Hash.new
  #   answer_choices = self.answer_choices
  #
  #   answer_choices.each do |answer_choice|
  #     hash[answer_choice] = answer_choice.responses.length
  #   end
  #
  #   hash
  # end


  # def results
  #   hash = Hash.new
  #   answer_choices = self.answer_choices.includes(:responses)
  #
  #   answer_choices.each do |answer_choice|
  #     hash[answer_choice] = answer_choice.responses.length
  #   end
  #
  #   hash
  # end


  def results

    searches = Question.find_by_sql(<<-SQL, @id)
      SELECT
        answer_choices.*, COUNT(responses.id)
      FROM
        answer_choices
      JOIN
        responses ON answer_choices.id = responses.answer_choice_id
      WHERE
        (responses.answer_choice_id IS NOT NULL) AND (answer_choices.question_id = ?)
      GROUP BY
        answer_choices.id;
    SQL

  end
end
