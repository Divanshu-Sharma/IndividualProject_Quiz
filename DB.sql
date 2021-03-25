--create Table--
CREATE TABLE IF NOT EXISTS questions(
      questionId INT(6) NOT NULL PRIMARY KEY,
      question VARCHAR(255),
      correctAnswer VARCHAR(255)
    );

--create options table--
CREATE TABLE IF NOT EXISTS options(
        optionsId INT(6) AUTO_INCREMENT PRIMARY KEY,
        questionId INT(6),
        optionValue VARCHAR(255)
      );

--inserting values into questions table--
INSERT INTO questions (questionId, question, correctAnswer) VALUES (?,?,?);

--inserting values into options table--
INSERT INTO options (questionId, optionValue) Values (${id}, ${req.body.opt1}), (${id}, ${req.body.opt2});
INSERT INTO options (questionId, optionValue) Values (${id}, ${req.body.opt1}), (${id}, ${req.body.opt2}),  (${id}, '${req.body.opt3}');
INSERT INTO options (questionId, optionValue) Values (${id}, ${req.body.opt1}), (${id}, ${req.body.opt2}), (${id}, '${req.body.opt3}'),(${id}, '${req.body.opt4}');

--To get all questions with all answers--
SELECT questions.questionId, questions.question AS question, questions.correctAnswer AS correctAnswer, GROUP_CONCAT(options.optionValue SEPARATOR  ', ' ) AS options FROM options, questions where questions.questionId = options.questionId GROUP by questions.questionId;

--to get all options--
SELECT optionsId, optionValue FROM options where questionId = ${id};

--To update the questions--
UPDATE questions SET question = ?, correctAnswer = ? WHERE questionId = ${id};

--To update the set options--
UPDATE options SET optionValue = ? WHERE optionsId = ${id};

--To delete a question--
DELETE questions, options FROM questions INNER JOIN options ON questions.questionId = options.questionId WHERE questions.questionId = ${id}`;