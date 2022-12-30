export default function Drink({drink}){
  const {name, glass, instructions_en, ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, measure1, measure2, measure3, measure4, measure5} = drink
  
  return(
    <div className="Card">
      <h2>{name}</h2>
      <p>🥃 {glass}</p>
      <h3>Ingredients</h3>
      <ul>
        <li>{measure1} {ingredient1}</li>
        <li>{measure2} {ingredient2}</li>
        <li>{measure3} {ingredient3}</li>
        <li>{measure4} {ingredient4}</li>
        <li>{measure5} {ingredient5}</li>
      </ul>
      <p>{instructions_en}</p>
    </div>
  )
} 
