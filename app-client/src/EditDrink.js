import React, { useState } from "react";

export default function EditDrink({ drink, onUpdateDrink }){
  const { name, id } = drink // , instructions_en
  const [drinkName, setDrinkName] = useState(name)
  // const [instructions, setInstructions] = useState(instructions_en)

  function handleFormSubmit(e){
    e.preventDefault();

    fetch(`http://localhost:9292/drinks/${id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name: drinkName, // ?
      }),
    })
    .then(r => r.json())
    .then(updatedDrink => onUpdateDrink(updatedDrink))
  }

  return(
    <form onSubmit={handleFormSubmit} >
      <input 
        className="Form-input" 
        type="text"
        name="name" // "name" or "drinkName"?
        value={drinkName} // drinkName or name ?
        onChange={e => setDrinkName(e.target.value)}      
      />
      <input type="submit" value="Save" className="Ghost-button" />
    </form>
  )
}

//       {/* <label>Ingredients
//       <input 
//         className="Form-input"
//         type="text"
//         name="name"
//         value={drinkName}
//         onChange={e => setDrinkName(e.target.value)}      
//       />

// <input 
//         className="Form-input"
//         type="text"
//         name="name"
//         value={drinkName}
//         onChange={e => setDrinkName(e.target.value)}      
//       />

// <input 
//         className="Form-input"
//         type="text"
//         name="name"
//         value={drinkName}
//         onChange={e => setDrinkName(e.target.value)}      
//       />

//       </label>
//       <input 
//         className="Form-input"
//         type="text"
//         name="instructions"
//         value={instructions_en}
//         onChange={e => setInstructions(e.target.value)}      
//       /> */}