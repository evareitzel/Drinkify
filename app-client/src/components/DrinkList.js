import React from "react";
import Drink from "./Drink";

function DrinkList(drinks){
  return(
    <div>
      <h2>Hi from DrinkList!</h2>
      <ul>
        {drinks.map(drink => (
          <Drink name={drink.name} /> // 
        ))}

      </ul>
    </div>
  )
}

export default DrinkList;