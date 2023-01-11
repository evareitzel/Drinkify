import React, { useState } from "react"

export default function NewDrink({ onAddDrink, mixologists }){
  const [name, setName] = useState("")
  // const [ingredients, setIngredients] = useState("")
  const [instructions, setInstructions] = useState("")
  const [mixologistId, setMixologistId] = useState("") // console-logs 'NULL' on submit
  const [mixologist, setMixologist] = useState("")

  function handleSubmit(e){
    e.preventDefault()
    window.alert(`${name} added!`)
    console.log(e.target.value)
    console.log(mixologistId)

    const drinkData = {
      name: name,
      instructions: instructions,
      mixologist_id: mixologistId // FIX
    }

    fetch("http://localhost:9292/drinks", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(drinkData),
    })
      .then(r => r.json())
      .then(newDrink => {
        onAddDrink(newDrink)
        setName("")
        setInstructions("")
      })
  }

  const options =  mixologists.map(mixologist => { 
    return  <option 
              key={mixologist.id} 
              value={mixologist.id}
            >
              {mixologist.name}
            </option>
  })
  
  const handleDropdownChange = e => {
    setMixologist(e.target.value)
  }
  console.log(mixologist)


  return(
    <div className="Form-wrapper">
      <a className="App-link" href="#" >
        Add new drink
      </a> {/* <h2>Add new drink</h2> */}
      <form className="Form" onSubmit={handleSubmit} >
        <label>Name
          <input
            onChange={e => setName(e.target.value)}
            placeholder="Drink name"
            type="text"
            value={name}
            className="Form-input"
        />
        </label>
        <label>Instructions
          <input
            onChange={e => setInstructions(e.target.value)}
            type="text"
            placeholder="Sugar, spice, everything nice..."
            value={instructions}
            className="Form-input"
          />
        </label>

        <label>
          Created by:
          <select value={mixologist} onChange={handleDropdownChange} className="Dropdown">
          
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