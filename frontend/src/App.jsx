import { useState } from 'react'
import './App.css'
import axios from 'axios'

const API = 'http://ec2-13-60-162-177.eu-north-1.compute.amazonaws.com/'

function App() {
  const [data, setData] = useState({})

  const getData = async (endpoint) => {
    const response = await axios.get(`http://ec2-13-60-162-177.eu-north-1.compute.amazonaws.com/${endpoint}`)
    let data = {}
    data.columns = Object.keys(response.data[0])
    data.body = response.data
    setData(data)
  }

  return (
    <>
      <div className='fixed'>
        <h1>CS 421 - Reg.No E21-03-03796</h1>
        <h2>Loading from: {data.app_id}</h2>
        <button onClick={async () => { getData('students/') }}>
          Students
        </button>
        <button onClick={async () => { getData('subjects/') }}>
          Subjects
        </button>
      </div>
      <div className="data">
        {
          (!data.columns || data.columns.length < 1) ?
            <span>Nothing to show yet...</span>
            :
            <table>
              <thead>
                <tr>
                  {
                    data.columns.map((item, index) => (
                      <td key={index}>{item}</td>
                    ))
                  }
                </tr>
              </thead>
              <tbody>
                {
                  data.body.map((row, index) => (
                    <tr key={index}>
                      {
                        Object.keys(row).map((cell, i) => (
                          <td key={i}>{row[cell]}</td>
                        ))
                      }
                    </tr>
                  ))
                }
              </tbody>
            </table>
        }
      </div>
    </>
  )
}

export default App
