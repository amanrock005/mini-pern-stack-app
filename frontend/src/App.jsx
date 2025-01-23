import { useEffect, useState } from "react";
import { axiosInstance } from "./lib/axiosInstance";

function App() {
  const [answer, setAnswer] = useState(null);
  const [quiz, setQuiz] = useState([]);

  useEffect(() => {
    fetchQuizQuestion();
  }, []);

  const fetchQuizQuestion = async () => {
    try {
      const res = await axiosInstance.get("/accordionContent");
      setQuiz(res.data);
    } catch (err) {
      console.log("error occured while fetching quiz questions ", err.message);
    }
  };

  const handleClick = (id) => {
    setAnswer(answer === id ? null : id);
  };
  return (
    <div style={{ width: "370px", borderRight: "1px solid black" }}>
      <h3 style={{ padding: "10px" }}>Content</h3>
      {quiz.map((item) => (
        <div key={item.id} style={{ padding: "10px" }}>
          <div
            onClick={() => handleClick(item.id)}
            style={{ display: "flex", alignItems: "center", gap: "10px" }}
          >
            <p>{item.question}</p>
            <span>{answer === item.id ? "-" : "+"}</span>
          </div>
          {answer === item.id && item.answer}
        </div>
      ))}
    </div>
  );
}

export default App;
