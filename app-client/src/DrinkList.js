import Drink from "./Drink";

export default function DrinkList({drinks, mixologists, onUpdateDrink, onDeleteDrink}){
  
  return(
    <div >
        {drinks.map(drink => (
          <Drink 
            key={drink.id} 
            drink={drink} 
            onUpdateDrink={onUpdateDrink}
            onDeleteDrink={onDeleteDrink}
            mixologists={mixologists}
          />
        ))}
    </div>
  )
}
