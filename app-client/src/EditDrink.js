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
          className="Form-input"
          type="text"
          name="name"
          value={drinkName}
          onChange={e => setDrinkName(e.target.value)}
        />
      </label>
      <label>
        Ingredients
        <input
          className="Form-input"
          type="text"
          name="ingredients"
          value={drinkIngredients}
          onChange={e => setDrinkIngredients(e.target.value)}
        />
      </label>
      <label>
        Instructions
        <input
          className="Form-input"
          type="text"
          name="instructions"
          value={drinkInstructions}
          onChange={e => setDrinkInstructions(e.target.value)}
        />
      </label>

      <input type="submit" value="Save" className="Ghost-button" />
    </form>
  )
}
