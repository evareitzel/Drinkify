export default function Drink({name, glass, instructions_en, ingredient1, ingredient2, ingredient3, measure1, measure2
}){
  return(
    <div className="card">
      <h2>{name}</h2>
      <p>🥃 {glass}</p>
      <h3>Ingredients</h3>
      <ul>
        <li>{measure1} {ingredient1}</li>
        <li>{measure2}{ingredient2}</li>
        <li>{ingredient3}</li>
      </ul>
      <p>{instructions_en}</p>
    </div>
  )
} 
