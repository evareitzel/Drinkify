import React, {useState} from "react"
import EditDrink from './EditDrink'

export default function Drink({drink, mixologist, onUpdateDrink, onDeleteDrink}){ 

  const {id, name, instructions, ingredients, mixologist_id} = drink
  const [editDrink, setEditDrink] = useState(false)

  const showEditDrink = 
    editDrink
    ? <EditDrink drink={drink} onUpdateDrink={onUpdateDrink} />
    : null


  function handleDeleteClick(){
    window.alert(`${name} deleted!`)

    fetch(`http://localhost:9292/drinks/${id}`, {
      method: "DELETE",
    });
    onDeleteDrink(id, mixologist_id)
  }

  return(
    <div className="Card">
      <h2>{name}</h2>
      <h3>{ingredients}</h3>
      <p>{instructions}</p>
      <p>🍹 Created by {mixologist.name}</p>
      
      <a className="App-link" onClick={() => setEditDrink(!editDrink)}>
        Edit {editDrink ? ' 🡠' : ' 🡢'}
      </a>
      <span> | </span>
      <a className="App-link" onClick={handleDeleteClick} >
        Delete
      </a>
      {showEditDrink}
    </div>
  )
}
