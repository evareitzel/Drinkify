import EditDrink from './EditDrink'

export default function Drink({drink, mixologists, onUpdateDrink, onDeleteDrink}){
  const {id, name, instructions, ingredients, image, mixologist_id} = drink

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
      <img src={image} width="350" alt={name} className="Image" />
      <h2>{name}</h2>
      {/* <p>Recipe by {show_author(user_id)}</p> */}

      {/* <form>
        <label>
          Author:
          <input type="select">{username}</input> 
        </label>
      </form> */}
      
      <p>🍹 {ingredients}</p>
      <h3>Instructions</h3>
      <p>{instructions}</p>

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
