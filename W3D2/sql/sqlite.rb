require 'singleton'
require 'sqlite3'
require 'active_support/inflector'

class QuestionDatabase < SQLite3::Database 
  include Singleton 
  
  def initialize 
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end 
end 

class Potato
  def self.all
    data = QuestionDatabase.instance.execute("SELECT * FROM #{self.to_s.tableize}")
    data.map {|datum| self.new(datum)}
  end 
end


class Users < Potato
  attr_accessor :fname, :lname
  
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
  
  def liked_questions
    QuestionLikes.liked_questions_for_user_id(@id)
  end

  def save
    if @id 
      QuestionDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE 
          users
        SET 
          fname = ?, lname = ?
        WHERE
          id = ?
      SQL
    else 
      QuestionDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO 
          users (fname, lname)
        VALUES
          (?, ?)
      SQL
      @id = QuestionDatabase.instance.last_insert_row_id
    end     
  end 
  
  # def self.all
  #   data = QuestionDatabase.instance.execute("SELECT * FROM users")
  #   data.map {|datum| Users.new(datum)}
  # end 
  
  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users 
      WHERE
        id = ?
    SQL
    Users.new(data[0])
  end
  
  def self.find_by_name(fname, lname)
    data = QuestionDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users 
      WHERE
        fname = ? AND lname = ?
    SQL
    Users.new(data[0])
  end
  
  def authored_questions
    Questions.find_by_author_id(@id)
  end 
  
  def authored_replies
    Replies.find_by_user_id(@id)
  end
  
  def followed_questions 
    QuestionFollows.followed_questions_for_user_id(@id)
  end 
  
  def average_karma
    data = QuestionDatabase.instance.execute(<<-SQL, @id)
      SELECT 
        CAST(COUNT(question_likes.id) AS FLOAT) / COUNT(DISTINCT(questions.id))
      FROM 
        questions 
      LEFT JOIN 
        question_likes ON questions.id = question_likes.question_id 
      WHERE
        questions.user_id = ?
    SQL
  end 
  
end




class Questions 
  attr_accessor :title, :body, :user_id
  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @user_id = options["user_id"]
  end
  
  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Questions.new(data[0])
  end
  
  def likers 
    QuestionLikes.likers_for_question_id(@id)
  end
  
  def num_likes 
    QuestionLikes.num_likes_for_question_id(@id)
  end
  
  def self.find_by_title(title)
    data = QuestionDatabase.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        questions
      WHERE
        title = ?
    SQL
    Questions.new(data[0])
  end
  
  def self.find_by_author_id(user_id)
    data = QuestionDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    Questions.new(data[0])
  end
  
  def self.most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end
  
  def self.most_liked(n)
    QuestionLikes.most_liked_questions(n)
  end 
  
  def author
    data = QuestionDatabase.instance.execute(<<-SQL, @user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    Users.new(data[0])
  end 
  
  def replies
    Replies.find_by_question_id(@id)
  end 
  
  def followers
    QuestionFollows.followers_for_question_id(@id)
  end 
  
end





class QuestionFollows
  
  attr_accessor :question_id, :user_id
  
  def initialize(options)
    @id = options["id"]
    @question_id = options["question_id"]
    @user_id = options["user_id"]
  end
  
  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    QuestionFollows.new(data[0])
  end
  
  def self.followers_for_question_id(question_id)
    data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        * 
      FROM 
        users 
      JOIN question_follows
        ON users.id = question_follows.user_id 
      WHERE
        question_follows.question_id = ?
    SQL
    
    data.map {|datum| Users.new(datum)}
  end 
  
  def self.followed_questions_for_user_id(user_id)
    data = QuestionDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        * 
      FROM 
        questions
      JOIN question_follows
        ON questions.id = question_follows.question_id 
      WHERE
        question_follows.user_id = ?
    SQL
    
    data.map {|datum| Questions.new(datum)}
  end
  
  def self.most_followed_questions(n)
    data = QuestionDatabase.instance.execute(<<-SQL)
    SELECT
      *
    FROM
      questions 
    JOIN
      question_follows ON questions.id = question_follows.question_id
    GROUP BY
      questions.id
    ORDER BY
      COUNT(question_follows.user_id) DESC
    SQL
    data.take(n).map {|datum| Questions.new(datum)}
  end
end




class Replies 
  
  attr_accessor :user_id, :question_id, :parent_id, :body
  
  def initialize(options)
    @id = options["id"]
    @user_id = options["user_id"]
    @question_id = options["question_id"]
    @parent_id = options["parent_id"]
    @body = options["body"]
  end
  
  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    Replies.new(data[0])
  end
  
  def self.find_by_user_id(user_id)
    data = QuestionDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    Replies.new(data[0])
  end
  
  def self.find_by_question_id(question_id)
    data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    data.map {|datum| Replies.new(datum)}
  end
  
  def author 
    data = QuestionDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    Users.new(data[0])
  end 
  
  def question
    data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Questions.new(data[0])
  end 
  
  def parent_reply
    if self.parent_id.nil?
      raise "#{self.body} is top comment"
    end
    
    data = QuestionDatabase.instance.execute(<<-SQL, @parent_id)
    SELECT
      *
    FROM
      replies 
    WHERE
      id = ?
    SQL
    Replies.new(data[0])
  end
  
  def child_replies
    data = QuestionDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies 
      WHERE 
        parent_id = ?
      SQL
      Replies.new(data[0])
  end
end





class QuestionLikes 
  
  attr_accessor :question_id, :user_id
  
  def initialize(options)
    @id = options["id"]
    @question_id = options["question_id"]
    @user_id = options["user_id"]
  end
  
  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    QuestionLikes.new(data[0])
  end
  
  def self.likers_for_question_id(question_id)
    data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        * 
      FROM 
        users 
      JOIN question_likes
        ON users.id = question_likes.user_id 
      WHERE
        question_likes.question_id = ?
    SQL
    
    data.map {|datum| Users.new(datum)}
  end 
  
  def self.num_likes_for_question_id(question_id)
    data = QuestionDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        COUNT(question_likes.user_id) AS num_of_likes
      FROM 
        question_likes
      WHERE 
        question_likes.question_id = ?
    SQL
    data
  end 
  
  def self.liked_questions_for_user_id(user_id)
    data = QuestionDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      *
    FROM
      questions 
    JOIN
      question_likes ON question_likes.question_id = questions.id
    WHERE
      question_likes.user_id = ?
    SQL
    data.map {|datum| Questions.new(datum)}
  end
  
  def self.most_liked_questions(n)
    data = QuestionDatabase.instance.execute(<<-SQL)
    SELECT
      *
    FROM
      questions
    JOIN
      question_likes ON questions.id = question_likes.question_id
    GROUP BY
      questions.id
    ORDER BY
      COUNT(questions.user_id) DESC
    SQL
    data.map {|datum| Questions.new(datum)}
  end
  
end