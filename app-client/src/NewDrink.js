import React, { useState } from "react"

export default function NewDrink({ onAddDrink }){ // currentUser
  const [name, setName] = useState("");
  // const [instructions_en, setInstructions_en] = useState("");
  // const [body, setBody] = useState("")
  // ingredient1,

  function handleSubmit(e){
    e.preventDefault();

    fetch("http://localhost:9292/drinks", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        // username: currentUser.username,
        name: name,
        // instructions_en: instructions_en,
      }),
    })
      .then(r => r.json())
      .then(newDrink => {
        onAddDrink(newDrink);
        setName("");
        // setInstructions_en("")
        // setBody("");
      })
  }

  return(
    <div>
      <a className="App-link" href="#" >
        Add new drink
      </a>
      <form className="Form" onSubmit={handleSubmit}>
        <label>Name
          <input
            className="Form-input"
            type="text"
            name="name"
            // autoComplete="off"
            value={name}
            onChange={e => setName(e.target.value)}
          />
        </label>
        {/* <label>Instructions
          <input
            className="Form-input"
            type="text"
            name="instructions_en"
            // autoComplete="off"
            value={instructions_en}
            onChange={e => setInstructions_en(e.target.value)}
          />
        </label> */}
        <button type="submit" className="Button">Add drink</button>
      </form>

    </div>
  )
}