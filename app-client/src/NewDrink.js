import React, { useState } from "react"

export default function NewDrink({ onAddDrink }){ // currentUser
  const [name, setName] = useState("");
  const [instructions_en, setInstructions_en] = useState("");

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
        instructions_en: instructions_en,
      }),
    })
      .then(r => r.json())
      .then(newDrink => {
        onAddDrink(newDrink);
        setName("");
        setInstructions_en("")
      })
  }

  return(
    <div>
      {/* <a className="App-link" href="#" >
        Add new drink
      </a> */}
      <h2>Add new drink</h2>
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
        <label>Instructions
          <input
            className="Form-input"
            type="text"
            name="instructions_en"
            // autoComplete="off"
            value={instructions_en}
            onChange={e => setInstructions_en(e.target.value)}
          />
        </label>
        <div className="Button-wrapper">
          <button type="submit" className="Button">Add drink</button>
        </div>
      </form>

    </div>
  )
}