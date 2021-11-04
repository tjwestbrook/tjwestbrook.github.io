import React, { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import axios from 'axios';
import { DETA_PATH } from '../constants';
import { PuzzlePride, Pong } from '../projects';

export default function Project() {
  const { id } = useParams()
  const [projects, setProjects] = useState([])

  useEffect(() => {
    (async () => {
      id ? await axios.get(`${DETA_PATH}/project/${id}`)
      .then(res => setProjects([res.data]))
      .catch(err => console.log(err))
      : await axios.get(`${DETA_PATH}/projects`)
      .then(res => setProjects(res.data.reverse()))
      .catch(err => console.log(err))
    })();
    return () => {
      setProjects([])
    }
  }, [id])

  return projects.map(p =>
    <div key={p.key} style={{display: "inline-block", alignContent: "center"}}>
      <h2 style={{fontWeight: "bold", fontStyle: "italic", fontSize: "1.3rem"}}>
        {p.name} · {p.year}
      </h2>
      <Link to={`/project/${p.key}`}>
        <p className={p.key === '1' ? "glow-on-hover" : ""}>
          {p.description}
        </p>
      </Link>
      <div className="project" style={{ maxWidth: "80vw"}} >
        {(() => { return {
          0: <Pong />,
          1: <PuzzlePride />,
          // 2: <SudokuAI />,
          // 3: <PolyWind />
          }[id]
        })()}
      </div>
    </div>
  )
}