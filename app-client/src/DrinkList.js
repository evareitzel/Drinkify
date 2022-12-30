import Drink from "./Drink";

export default function DrinkList({drinks}){
  console.log(drinks)
  return(
    <div > {/* className="Drink-list" */}
      <h2>Drinks</h2>
      {/* <ul> */}
        {drinks.map(drink => (
          <Drink key={drink.id} drink = {drink} />
        ))}
      {/* </ul> */}
    </div>
  )
}