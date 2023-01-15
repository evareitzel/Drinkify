import Drink from "./Drink";

export default function DrinkList({drinks, mixologist, onUpdateDrink, onDeleteDrink}){
  

  const renderDrinks = 
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
    <div >
      {renderDrinks}  
    </div>
  )
}
