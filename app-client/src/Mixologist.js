import React, {useEffect, useState} from "react"

export default function Mixologist({ mixologistId }){
    const [mixologist, setMixologist] = useState([])

    useEffect(() => {
      fetch(`http://localhost:9292/mixologists/${mixologistId}`)
      .then(r => r.json())
      .then(mixologist => setMixologist(mixologist))
    }, [mixologistId])

    function handleMixologistClick(e){
      console.log(`${mixologist.name} got clicked!`)
      console.log(mixologist)
    }

    return(
      <div>
        <a className="App-link" onClick={handleMixologistClick}>
          {mixologist.name}
        </a>         
 
    </div>
  )
}