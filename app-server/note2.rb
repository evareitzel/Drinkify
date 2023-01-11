
// import DrinkList from "./DrinkList"
// import NewDrink from "./NewDrink"
// import NewMixologist from "./NewMixologist"


  const [drinks, setDrinks] = useState([])



//   useEffect(() => {
//     fetch("http://localhost:9292/drinks")
//     .then(r => r.json())
//     .then(drinks => setDrinks(drinks))
//   }, [])

//   function handleAddMixologist(newMixologist){
//     setMixologists([...mixologists, newMixologist])
//   }

//   function handleAddDrink(newDrink) {
//     setDrinks([...drinks, newDrink])
//   }

  // function handleUpdateDrink(updatedDrink){
  //   console.log(updatedDrink)
//     const updatedDrinks = drinks.map(drink => {
//       if(drink.id === updatedDrink.id){
        // return updatedDrink
//       }else{
        // return drink
//       }
//     })
//     setDrinks(updatedDrinks)
  // }

  // function handleDeleteDrink(id){
  //   const updatedDrinks = drinks.filter(drink => drink.id !== id)
  //   setDrinks(updatedDrinks)
//   }  
  console.log(mixologists)
//   console.log(drinks)

// const renderMixologists = mixologists.map(mixologist => (
//   <Mixologist 
//     key={mixologist.id}
//     mixologistId={mixologist.id}
//     onUpdateDrink={handleUpdateDrink}
//     onDeleteDrink={handleDeleteDrink} 
// />
// ))




        {/* // <NewDrink onAddDrink={handleAddDrink} mixologists={mixologists} />
//         <NewMixologist onAddMixologist={handleAddMixologist} />  */}


}

##
##
##
## ARCHIVE ##

import React, { useEffect, useState } from "react"

import Header from "./Header"
// import Mixologist from "./Mixologist"
// import DrinkList from "./DrinkList"
// import NewDrink from "./NewDrink"
// import NewMixologist from "./NewMixologist"
import "./App.css"

export default function App() {
  const [mixologists, setMixologists] = useState([])
  const [drinks, setDrinks] = useState([])

  useEffect(() => {
    fetch("http://localhost:9292/mixologists")    
    .then(r => r.json())
    .then(mixologists => setMixologists(mixologists))
  }, [])

//   useEffect(() => {
//     fetch("http://localhost:9292/drinks")
//     .then(r => r.json())
//     .then(drinks => setDrinks(drinks))
//   }, [])

//   function handleAddMixologist(newMixologist){
//     setMixologists([...mixologists, newMixologist])
//   }

//   function handleAddDrink(newDrink) {
//     setDrinks([...drinks, newDrink])
//   }

  // function handleUpdateDrink(updatedDrink){
  //   console.log(updatedDrink)
//     const updatedDrinks = drinks.map(drink => {
//       if(drink.id === updatedDrink.id){
        // return updatedDrink
//       }else{
        // return drink
//       }
//     })
//     setDrinks(updatedDrinks)
  // }

  // function handleDeleteDrink(id){
  //   const updatedDrinks = drinks.filter(drink => drink.id !== id)
  //   setDrinks(updatedDrinks)
//   }  
  console.log(mixologists)
//   console.log(drinks)


//     onUpdateDrink={handleUpdateDrink}
//     onDeleteDrink={handleDeleteDrink} 
// />

  return (
    <div className="App">
      <div className="Wrapper">
        <Header />
        <h2>Mixologists</h2>
        {/* {renderMixologists} */}

        {/* // <NewDrink onAddDrink={handleAddDrink} mixologists={mixologists} />
//         <NewMixologist onAddMixologist={handleAddMixologist} />  */}

      </div>       
    </div>
  )
}}


#### ARCHIVE ####
import React, {useEffect, useState} from "react"
// import DrinkList from "./DrinkList"
import Drink from "./Drink"


export default function Mixologist({ mixologistId, onUpdateDrink, onDeleteDrink }){
  const [mixologist, setMixologist] = useState([])
  // const [drinks, setDrinks] = useState([])

  useEffect(() => {
    fetch(`http://localhost:9292/mixologists/${mixologistId}`)
    .then(r => r.json())
    .then(mixologist => setMixologist(mixologist))
    // .then(mixologist => setDrinks(mixologist.drinks))
  }, [mixologistId])

  function handleMixologistClick(e){
    console.log(`${mixologist.name} got clicked!`)

        // drinks.map(drink => (
        //   <Drink 
        //     key={drink.id} 
        //     drink={drink} 
        //     onUpdateDrink={onUpdateDrink}
        //     onDeleteDrink={onDeleteDrink}
        //     mixologist={mixologist}
        //   />
        // ))
  }

  console.log(mixologist.drinks)

  // const renderDrinks = 
  const drinks = mixologist.drinks
  console.log(drinks)
    // drinks.map(drink => (
    //       <Drink 
    //         key={drink.id} 
    //         drink={drink} 
    //         onUpdateDrink={onUpdateDrink}
    //         onDeleteDrink={onDeleteDrink}
    //         mixologist={mixologist}
    //       />
    //     ))

  return(
    <div>
      <a className="App-link" onClick={handleMixologistClick}>
        {mixologist.name}
      </a>
      {/* {renderDrinks} */}
      {/* <DrinkList drinks={mixologist.drinks} onUpdateDrink={onUpdateDrink} onDeleteDrink={onDeleteDrink}/>      */}
    </div>
  )
}

#
#
#
#
#
#
# ARCHIVED Drink.js

// import EditDrink from './EditDrink'

export default function Drink({drink, mixologist}){ 
// ({drink, onUpdateDrink, onDeleteDrink}){ 
  // mixologist, 

  // const {id, name, instructions, ingredients, image, mixologist_id} = drink

  // function handleDeleteClick(){
  //   fetch(`http://localhost:9292/drinks/${id}`, {
  //     method: "DELETE",
  //   });
  //   onDeleteDrink(id)
  // }

  // function show_author(user_id){
    // const found = users.find(user =>
    //   user.id === user_id)
  //   return found.name
  // }

  return(
    <div className="Card">
      {/* <img src={image} width="350" alt={name} className="Image" /> */}
      <h2>{drink.name}</h2>
      {/* <h2>{name}</h2> */}

      {/* <p>Recipe by {show_author(user_id)}</p> */}
      <p>Created by {mixologist.name}</p>

      {/* <form>
        <label>
          Author:
          <input type="select">{username}</input> 
        </label>
      </form> */}
      
      {/* <p>🍹 {ingredients}</p>
      <h3>Instructions</h3>
      <p>{instructions}</p> */}

      {/* <EditDrink drink={drink} onUpdateDrink={onUpdateDrink} /> */}
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

      {/* <a className="App-link"  onClick={handleDeleteClick} >
        Delete
      </a> */}
      {/* add popup window confirming that drink was destroyed! */}
    </div>
  )
} 
