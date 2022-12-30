import {useState} from 'react'

export default function Search(){
  return(
    <div >
      <form> 
        <label>🔍
<input className="Search"
  // onChange={e => setSearch(e.target.value)} 
  placeholder="Search drinks..."
  type="text"
  // value={name}
  // className="form-input"
/>
</label>
      </form>
    </div>
  )
}

// <form onSubmit={handleSubmit}>
{/* <label className="label">Name 
<input 
  onChange={e => setName(e.target.value)} 
  placeholder="Drink name"
  type="text"
  value={name}
  className="form-input"
/>
</label> */}