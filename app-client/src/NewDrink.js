import React, { useState } from "react"

export default function NewDrink({ mixologists }){
  // onAddDrink
  const [name, setName] = useState("")
  const [ingredients, setIngredients] = useState("")
  const [instructions, setInstructions] = useState("")
  const [mixologistId, setMixologistId] = useState()

  console.log(mixologistId)
  // console.log(mixologists)

  const options =  mixologists.map(mixologist => { 
    return <option  
            key={mixologist.id} 
            value={mixologist.id}
          >
            {mixologist.name}
          </option>
  }) 

  return(
    <div> {/* className="Form-wrapper" */}
      <h2>Add new drink</h2>
      <form className="Form" >
      {/* onSubmit={handleSubmit}  */}
        <label>Name
          <input
            onChange={e => setName(e.target.value)} 
            placeholder="Drink name" 
            className="Form-input"
          />
    {/* type="text"
  //           value={name}
  //           className="Form-input" */}
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
          /> 
        {/* type="text" */}
        {/* value={instructions} */}
        </label>
        <label>
          Created by:
          <select 
            onChange= {e => setMixologistId(e.target.value)}
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

//   const [mixologistId, setMixologistId] = useState("") // console-logs 'NULL' on submit

//   function handleSubmit(e){
//     e.preventDefault()
//     window.alert(`${name} added!`)
//     console.log(e.target.value)
//     console.log(mixologistId)

//     const drinkData = {
//       name: name,
//       instructions: instructions,
//       mixologist_id: mixologistId // FIX
//     }

//     fetch("http://localhost:9292/drinks", {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: JSON.stringify(drinkData),
//     })
//       .then(r => r.json())
//       .then(newDrink => {
//         onAddDrink(newDrink)
//         setName("")
//         setInstructions("")
//       })
//   }
