// import React from "react";
import Drink from "./Drink";

export default function DrinkList({drinks, users, onUpdateDrink, onDeleteDrink}){

  return(
    <div >
        {drinks.map(drink => (
          <Drink 
            key={drink.id} 
            drink={drink} 
            onUpdateDrink={onUpdateDrink}
            onDeleteDrink={onDeleteDrink}
            users={users}
          />
        ))}
    </div>
  )
}
