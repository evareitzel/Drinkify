import React, { useState } from "react"

export default function NewDrink({ mixologists, onAddDrink}) {

  const [name, setName] = useState("")
  const [ingredients,
    setIngredients] = useState("")
  const [instructions, setInstructions] = useState("")
  const [mixologistId, setMixologistId] = useState("")

  function handleSubmit(e) {
    e.preventDefault()
    window.alert(`${name} added!`)
    
    fetch("http://localhost:9292/drinks", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name: name,
        ingredients: ingredients,
        instructions: instructions,
        mixologist_id: mixologistId
      }),
    })
    .then(r => r.json())
    .then(newDrink => {
      onAddDrink(newDrink)
    })
    setName("")
    setIngredients("")
    setInstructions("")
    setMixologistId("")
  }

  const options = mixologists.map(mixologist => {
    return <option
      key={mixologist.id}
      value={mixologist.id}
    >
      {mixologist.name}
    </option>
  })

  return (
    <div>
      <hr className="Separator" />
      <h2>Add drink</h2>
      <form className="Form" onSubmit={handleSubmit}>
        <label>Name
          <input
            onChange={e => setName(e.target.value)}
            placeholder="Drink name"
            type="text"
            value={name}
            required
            className="Form-input"
          />
        </label>
        <label>Ingredients
          <input
            onChange={e => setIngredients(e.target.value)}
            placeholder="Sugar, spice, everything nice"
            type="text"
            value={ingredients}
            className="Form-input"
          />
        </label>
        <label>Instructions
          <input
            onChange={e => setInstructions(e.target.value)}
            placeholder="First things first..."
            type="text"
            value={instructions}
            className="Form-input"
          />
        </label>
        <label>
          Created by:
          <select
            onChange={e => setMixologistId(e.target.value)}
            value={mixologistId}
            required
            className="Dropdown"
          >
            <option></option>
            {options}
          </select>
        </label>

        <div className="Button-wrapper">
          <button type="submit" className="Button">Add drink</button>
        </div>
      </form>
    </div>
  )
}
