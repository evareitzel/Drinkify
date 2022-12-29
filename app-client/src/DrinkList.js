import Drink from "./Drink";

export default function DrinkList(drinks){
  return(
    <div>
      <h2>Hi from DrinkList!</h2>
      <ul>
        <li>drink1</li>
        <li>drink2</li>
        {/* {drinks.map(drink => 
          <Drink />
        )} */}

      </ul>
    </div>
  )
}