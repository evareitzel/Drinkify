import React, { useState } from "react"

export default function EditDrink({ drink, onUpdateDrink }) {

  const { name, id, ingredients, instructions } = drink
  const [drinkName, setDrinkName] = useState(name)
  const [drinkIngredients, setDrinkIngredients] = useState(ingredients)
  const [drinkInstructions, setDrinkInstructions] = useState(instructions)

  function handleFormSubmit(e) {
    e.preventDefault();
    window.alert(`${drinkName} updated!`)

    fetch(`http://localhost:9292/drinks/${id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name: drinkName,
        instructions: drinkInstructions,
        ingredients: drinkIngredients,
      }),
    })
      .then(r => r.json())
      .then(updatedDrink => onUpdateDrink(updatedDrink))
  }

  return (
    <form onSubmit={handleFormSubmit} >
      <br />
      <label>Name
        <input
          onChange={e => setDrinkName(e.target.value)}
          type="text"
          value={drinkName}
          required
          className="Form-input"
        />
      </label>
      <label>
        Ingredients
        <input
          onChange={e => setDrinkIngredients(e.target.value)}
          type="text"
          value={drinkIngredients}
          className="Form-input"
        />
      </label>
      <label>
        Instructions
        <textarea rows="4"
          onChange={e => setDrinkInstructions(e.target.value)}
          type="text"
          value={drinkInstructions}
          className="Form-input"
        />
      </label>

      <input type="submit" value="Save" className="Ghost-button" />
    </form>
  )
}
