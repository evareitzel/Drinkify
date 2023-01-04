// import React from "react"
import EditDrink from './EditDrink'

export default function Drink({drink, onUpdateDrink, onDeleteDrink}){
  const {id, name, glass, instructions_en, ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, measure1, measure2, measure3, measure4, measure5} = drink
  
  function handleDeleteClick(){
    fetch(`http://localhost:9292/drinks/${id}`, {
      method: "DELETE",
    });
    onDeleteDrink(id)
  }

  return(
    <div className="Card">
      <h2>{name}</h2>
      <p>🥃 {glass}</p>
      <h3>Ingredients</h3>
      <ul>
        <li>{measure1} {ingredient1}</li>
        <li>{measure2} {ingredient2}</li>
        <li>{measure3} {ingredient3}</li>
        {/* <li>{measure4} {ingredient4}</li>
        <li>{measure5} {ingredient5}</li> */}
      </ul>
      <p>{instructions_en}</p>
      <a className="App-link" href="#" >
        Edit drink
      </a>
      <EditDrink drink={drink} onUpdateDrink={onUpdateDrink} />
      {/* <form >
          <label className="label">Name 
          <input className="form-input"
            // onChange={e => setName(e.target.value)} 
            placeholder={name}
            type="text"
            value={name}
            // className="form-input"
          />
          </label>
          <label className="label">Instructions
          <input className="form-input"
            // onChange={e => setName(e.target.value)} 
            placeholder={instructions_en}
            type="text"
            value={instructions_en}
            // className="form-input"
          />
          </label>
    </form> */}
      <span> | </span>
      {/* <a className="App-link" href="#" onClick={handleDeleteClick}>
        Delete drink
      </a> */}
      <button onClick={handleDeleteClick}>
        Delete drink
      </button>

    </div>
  )
} 
