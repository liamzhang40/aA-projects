# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Poll.destroy_all
User.destroy_all
Question.destroy_all
Response.destroy_all
AnswerChoice.destroy_all

user1 = User.create!(username: "Lifazul_Tonmoy")
user2 = User.create!(username: "Liam")
user3 = User.create!(username: "Patrick")
user4 = User.create!(username: "Maurice")
user5 = User.create!(username: "Oscar")
user6 = User.create!(username: "Abby")

poll1 = Poll.create!(title: "sleep", user_id: user1.id)
poll2 = Poll.create!(title: "color", user_id: user2.id)
poll3 = Poll.create!(title: "intelligence", user_id: user3.id)

question1 = Question.create!(text: "What time did you sleep?", poll_id: poll1.id)
question2 = Question.create!(text: "Do you take naps?", poll_id: poll1.id)
question3 = Question.create!(text: "What is the color of the sky?", poll_id: poll2.id)
question4 = Question.create!(text: "What is the color of the ocean?", poll_id: poll2.id)
question5 = Question.create!(text: "Who is the smartest?", poll_id: poll3.id)

answerchoice1 = AnswerChoice.create!(answer: "9", question_id: question1.id)
answerchoice2 = AnswerChoice.create!(answer: "11", question_id: question1.id)
answerchoice3 = AnswerChoice.create!(answer: "12", question_id: question1.id)

answerchoice4 = AnswerChoice.create!(answer: "Yes", question_id: question2.id)
answerchoice5 = AnswerChoice.create!(answer: "No", question_id: question2.id)

answerchoice6 = AnswerChoice.create!(answer: "Red", question_id: question3.id)
answerchoice7 = AnswerChoice.create!(answer: "Purple", question_id: question3.id)
answerchoice8 = AnswerChoice.create!(answer: "Blue", question_id: question3.id)

answerchoice9 = AnswerChoice.create!(answer: "Red", question_id: question4.id)
answerchoice10 = AnswerChoice.create!(answer: "Purple", question_id: question4.id)
answerchoice11 = AnswerChoice.create!(answer: "Blue", question_id: question4.id)

answerchoice12 = AnswerChoice.create!(answer: "Steve Jobs", question_id: question5.id)
answerchoice14 = AnswerChoice.create!(answer: "Bill Gates", question_id: question5.id)
answerchoice15 = AnswerChoice.create!(answer: "Steve Wozniak", question_id: question5.id)

Response.create!(answer_choice_id: answerchoice2.id, user_id: user4.id)
Response.create!(answer_choice_id: answerchoice9.id, user_id: user6.id)
Response.create!(answer_choice_id: answerchoice4.id, user_id: user5.id)
Response.create!(answer_choice_id: answerchoice6.id, user_id: user1.id)
Response.create!(answer_choice_id: answerchoice10.id, user_id: user3.id)
Response.create!(answer_choice_id: answerchoice8.id, user_id: user3.id)

Response.create!(answer_choice_id: answerchoice3.id, user_id: user6.id)
Response.create!(answer_choice_id: answerchoice7.id, user_id: user4.id)
Response.create!(answer_choice_id: answerchoice9.id, user_id: user5.id)
Response.create!(answer_choice_id: answerchoice15.id, user_id: user2.id)
Response.create!(answer_choice_id: answerchoice11.id, user_id: user1.id)
Response.create!(answer_choice_id: answerchoice1.id, user_id: user5.id)
