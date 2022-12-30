import Drink from "./Drink";

export default function DrinkList({drinks, onDrinkDelete,}){
  console.log(drinks)
  return(
    <div > {/* className="Drink-list" */}
      <h2>Drinks</h2>
      {/* <ul> */}
        {drinks.map(drink => (
          <Drink 
            key={drink.id} 
            drink={drink} 
            onDrinkDelete={onDrinkDelete}
          />
        ))}
      {/* </ul> */}
    </div>
  )
}