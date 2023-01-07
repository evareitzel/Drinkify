// import React from "react"
import EditDrink from './EditDrink'

export default function Drink({drink, mixologists, onUpdateDrink, onDeleteDrink}){
  const {id, name, glass, instructions_en, ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, measure1, measure2, measure3, measure4, measure5, image, mixologist_id} = drink
  
  function handleDeleteClick(){
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
      <img src={image} width="350" alt={name} />
      <h2>{name}</h2>
      {/* <p>Recipe by {show_author(user_id)}</p> */}

      {/* <form>
      

        <label>
          Author:
          <input type="select">{username}</input> 
        </label>

      </form> */}
      
      <p>🍹 {glass}</p>
      <h3>Ingredients</h3>
      <ul>
        <li>{measure1} {ingredient1}</li>
        <li>{measure2} {ingredient2}</li>
        <li>{measure3} {ingredient3}</li>
        <li>{measure4} {ingredient4}</li>
        <li>{measure5} {ingredient5}</li>
      </ul>
      <h3>Instructions</h3>
      <p>{instructions_en}</p>

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
      {/* <a className="App-link" href="#" onClick={handleDeleteClick}>
        Delete drink
      </a> */}

      <a className="App-link"  onClick={handleDeleteClick} >
        Delete
      </a>
      {/* add popup window confirming that drink was destroyed! */}
    </div>
  )
} 
