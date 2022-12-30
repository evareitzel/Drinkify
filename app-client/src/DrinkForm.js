import React, { useEffect, useState } from "react";

export default function DrinkForm({drink}){
  // onSubmit={handleSubmit}
  return(
    <form >
      <label>
        <input></input>
      </label>
          <label className="label">Name 
          <input 
            onChange={e => setName(e.target.value)} 
            placeholder={drink.name}
            type="text"
            value={name}
            // className="form-input"
          />
          </label>
    </form>
  )
}