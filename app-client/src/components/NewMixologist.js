import React, { useState } from "react"

export default function NewMixologist({ onAddMixologist }){
  const [name, setName] = useState("")

  function handleSubmit(e){
    e.preventDefault()
    window.alert(`${name} is added!`)


    fetch("http://localhost:9292/mixologists", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name: name
      }),
    })
    .then(r => r.json())
    .then(newMixologist => {
      onAddMixologist(newMixologist)
    })
    setName("")
  }

  return(
    <div>
      <hr className="Separator"/>
      <h2>Add mixologist</h2>
      <form onSubmit={handleSubmit} className="Form">
        <label>
          Name
          <input 
            onChange={e => setName(e.target.value)}
            placeholder="Your name"
            type="text"
            value={name}
            required
            className="Form-input"
          />
        </label>
        <div className="Button-wrapper">
          <button type="submit" className="Button">Add mixologist</button>
        </div>
      </form>
    </div>
  )
}
