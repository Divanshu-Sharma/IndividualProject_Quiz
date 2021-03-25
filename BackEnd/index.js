const cors = require('cors');
const express = require('express');
const app = express();

const { getQuestions, postNewQuestion, deleteQuestion, getAllOptions, editQuestion, editAllOptions} = require("./routes")

app.use(express.json());
app.use(cors());
app.get("/questions", getQuestions);
app.post("/question", postNewQuestion);
app.get("/:id/options", getAllOptions)
app.put("/:id", editQuestion);
app.put("/options/:id", editAllOptions);
app.delete("/:id", deleteQuestion);

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listening on port ${port}...`));