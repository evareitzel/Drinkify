import React, { useState } from "react"

export default function NewMixologist({ onAddMixologist }){
  const [name, setName] = useState("")

  function handleSubmit(e){
    e.preventDefault()

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
      // console.log(newMixologist)
      onAddMixologist(newMixologist)
    })
  }

  return(
    <form onSubmit={handleSubmit} className="Form">
      <hr className="Separator"/>
      <h2>Add mixologist</h2>
      <label>
        Name
        <input 
          onChange={e => setName(e.target.value)}
          // type="text"
          // value={name}
          placeholder="Your name"
          className="Form-input"
        />
      </label>
      <div className="Button-wrapper">
        <button type="submit" className="Button">Add mixologist</button>
      </div>
    </form>
  )
}
