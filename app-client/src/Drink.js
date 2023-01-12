import React, {useState} from "react"
import EditDrink from './EditDrink'

export default function Drink({drink, mixologist, onUpdateDrink, onDeleteDrink}){ 

  const {id, name, instructions, ingredients} = drink
  const [editDrink, setEditDrink] = useState(false)

  // const {image, mixologist_id} = drink

  const showEditDrink = 
    editDrink
    ? <EditDrink drink={drink} onUpdateDrink={onUpdateDrink} />
    : null


  function handleDeleteClick(){
    window.alert(`${name}, bye 👋👋`)

    fetch(`http://localhost:9292/drinks/${id}`, {
      method: "DELETE",
    });
    onDeleteDrink(id)
  }

  // function show_author(user_id){
    // const found = users.find(user =>
    //   user.id === user_id)
  //   return found.name
  // }

  return(
    <div className="Card">
      {/* <img src={image} width="350" alt={name} className="Image" /> */}
      <h2>{name}</h2>
      {/* <form>
        <label>
          Author:
          <input type="select">{username}</input> 
        </label>
      </form> */}
      
      <h3>{ingredients}</h3>
      <p>{instructions}</p>
      <p>🍹 Created by {mixologist.name}</p>
      <br />      
      
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
