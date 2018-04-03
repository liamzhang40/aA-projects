DROP TABLE IF EXISTS questions;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,--question can only have one author
  
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY, --insert users, unique follow
  
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL, -- the question, not the comment
  parent_id INTEGER, -- the comment replied to
  body TEXT NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('Tony', 'Stark');

INSERT INTO 
  users (fname, lname)
VALUES
  ('Darth', 'Vader');
  
INSERT INTO 
  users (fname, lname)
VALUES
  ('Alexander', 'Keefe');
  
INSERT INTO 
  users (fname, lname)
VALUES
  ('Liam', 'Zhang');  

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Question','I Have Successfully Privatized Peace',(SELECT id FROM users WHERE fname='Tony'));
  
  INSERT INTO
    questions (title, body, user_id)
  VALUES
    ('Not Liked','nothing',(SELECT id FROM users WHERE fname='Tony'));
  
INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Question 2','good question',(SELECT id FROM users WHERE fname='Darth'));
  
INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Question 3','How do we do this problem',(SELECT id FROM users WHERE fname='Liam'));
  
INSERT INTO 
  question_follows (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title ='Question'), (SELECT id FROM users WHERE fname='Darth'));
  
INSERT INTO 
  replies (user_id, question_id, parent_id, body)
VALUES
  ((SELECT id FROM users WHERE fname='Darth'), (SELECT id FROM questions WHERE title ='Question'), NULL, 'Cool comment');
  
INSERT INTO 
  replies (user_id, question_id, parent_id, body)
VALUES
  ((SELECT id FROM users WHERE fname='Tony'), (SELECT id FROM questions WHERE title ='Question'), (SELECT id FROM replies WHERE body ='Cool comment'), 'Cool, cool comment');

INSERT INTO 
  question_likes (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title ='Question'), (SELECT id FROM users WHERE fname='Darth'));

INSERT INTO 
  question_likes (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title ='Question 3'), (SELECT id FROM users WHERE fname='Liam'));
    
INSERT INTO 
  question_likes (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title ='Question 2'), (SELECT id FROM users WHERE fname='Darth'));
      
INSERT INTO 
  question_likes (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title ='Question 2'), (SELECT id FROM users WHERE fname='Darth'));
  
INSERT INTO 
  question_likes (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title ='Question 2'), (SELECT id FROM users WHERE fname='Alexander'));