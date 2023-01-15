import Drink from "./Drink";

export default function LatestDrinks({latestDrinks}){
  

  const renderDrinks = 
  console.log(latestDrinks)
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
