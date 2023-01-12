import React, { useState } from "react"

export default function NewDrink({ mixologists, onAddDrink }){
  const [name, setName] = useState("")
  const [ingredients, setIngredients] = useState("")
  const [instructions, setInstructions] = useState("")
  const [mixologistId, setMixologistId] = useState() // (mixologists[0].id) // works if saved BEFORE page refresh
    // could solve with a "choose mixologist" non-value dropdown initial state?

  function handleSubmit(e){
        e.preventDefault()
        window.alert(`${name} added!`)
        // console.log(e.target.value)
        // console.log(mixologistId)
    
        const drinkData = {
          name: name,
          ingredients: ingredients,
          instructions: instructions,
          mixologist_id: mixologistId // FIX // parseInt?
        }
    console.log(drinkData)

        fetch("http://localhost:9292/drinks", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(drinkData),
        })
          .then(r => r.json())
          .then(newDrink => {
            console.log(newDrink) // 
            // onAddDrink(newDrink)
          })
      }

  const options =  mixologists.map(mixologist => { 
    return <option  
            key={mixologist.id} 
            value={mixologist.id}
          >
            {mixologist.name}
          </option>
  }) 

  return(
    <div>
      <hr className="Separator"/>
      <h2>Add drink</h2>
      <form className="Form" onSubmit={handleSubmit}>
        <label>Name
          <input
            onChange={e => setName(e.target.value)} 
            placeholder="Drink name"
            // type="text"
            className="Form-input"
          />
        </label>
        <label>Ingredients
          <input 
            onChange={e => setIngredients(e.target.value)}
            placeholder="Sugar, spice, everything nice" 
            className="Form-input"  
          /> 
        </label>
        <label>Instructions
          <input 
            onChange={e => setInstructions(e.target.value)}
            placeholder="First things first..." 
            className="Form-input"
            // type="text"
          /> 
        </label>
        <label>
          Created by:
          <select 
            value={mixologistId}
            onChange={e => setMixologistId(e.target.value)} // parseInt
            // value={mixologistId} 
            className="Dropdown"
          >
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
