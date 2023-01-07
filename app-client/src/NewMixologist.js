import React, { useState } from "react"

export default function NewMixologist({ onAddMixologist }){
  const [name, setName] = useState("")

  function handleSubmit(e){
    e.preventDefault();

    fetch("http://localhost:9292/mixologists", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name: name,
        // key: name,
      }),
    })
      .then(r => r.json())
      .then(newMixologist => {
        onAddMixologist(newMixologist);
        setName("");
      })
  }

  return(
    <div className="Form-wrapper">
      <h2>Add mixologist</h2>
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

        <div className="Button-wrapper">
          <button type="submit" className="Button">Add mixologist</button>
        </div>
      </form>

    </div>
  )
}