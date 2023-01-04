// Nest under App component, over Drink.js
import DrinkList from "./DrinkList";
import NewDrink from "./NewDrink";


export default function User({user, drinks, onAddDrink, onUpdateDrink, onDeleteDrink}){
  const {name} = user
  console.log(drinks)
  return(
    <div>
      <h2>{name}</h2>
      <DrinkList 
        drinks={drinks}
        // currentUser={testUser}
        onAddDrink={onAddDrink}
        onUpdateDrink={onUpdateDrink} 
        onDeleteDrink={onDeleteDrink} 
      />
      <NewDrink onAddDrink={onAddDrink} />
    </div>
  )
}