export default function LatestDrinks({drinks}){

  const renderDrinks = drinks.map(drink => (
        <div className="Card">
          <h2>{drink.name}</h2>
          <h3>{drink.ingredients}</h3>
          <p>{drink.instructions}</p>
        </div>
      ))

  return(
    <div >
      <hr className = "Separator"/>
      <h2>Latest Drinks</h2>
      {renderDrinks}  
    </div>
  )
}
