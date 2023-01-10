import React, {useEffect, useState} from "react"

export default function Mixologist({ mixologistId }){
    const [mixologist, setMixologist] = useState([])

    useEffect(() => {
      fetch(`http://localhost:9292/mixologists/${mixologistId}`)
      .then(r => r.json())
      .then(mixologist => setMixologist(mixologist))
    }, [mixologistId])

    // console.log(mixologist)
    // handleClick = (){
    //   console.log('clicked!')
    // }

    return(
      <div>
        {/* <a className="App-link" href="#" onClick={this.handleClick()}>
{mixologist.name}
</a>         */}
 
        <a className="App-link" href="#" >
{mixologist.name}
</a>

{/* <button className="Button">{mixologist.name}</button> */}

    </div>
  )
}