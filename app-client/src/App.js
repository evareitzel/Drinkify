import React, { useEffect, useState } from "react"

import Header from "./Header"
import Mixologist from "./Mixologist"
import "./App.css"

export default function App() {
  const [mixologists, setMixologists] = useState([])


  useEffect(() => {
    fetch("http://localhost:9292/mixologists")    
    .then(r => r.json())
    .then(mixologists => setMixologists(mixologists))
  }, [])
  // console.log(mixologists)

  const renderMixologists = mixologists.map(mixologist => (
  <Mixologist 
    key={mixologist.id}
    mixologistId={mixologist.id}
  />
  ))

  return (
    <div className="App">
      <div className="Wrapper">
        <Header />
        <h2>Mixologists</h2>
        
        {renderMixologists}
        </div>       
    </div>
  )}