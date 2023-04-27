import React, { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { useAxios } from '../utils';
import Projects from '../projects';
import { FaPlay } from 'react-icons/fa';

export default function Project() {
  const { id } = useParams()
  const [project, setProject] = useState([])
  const response = useAxios()
  useEffect(() => {
    (async () => await response
      .then(res => setProject(id?[res.data]:res.data.reverse()))
      .catch(err => console.log(err))
    )();
    return () => setProject([]);
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id])

  return project.map(p => <div key={p.key} className="project">
    <h2>
      {Projects.slice(0).reverse().map((P,i,Ps) =>
        parseInt(p.key) === i && i < Ps.length ?
          <Link to={"/"+P.path}>
            <FaPlay style={{ color:"orange", paddingRight:"0.5rem"}}
              onMouseOver={({target})=>target.style.color="purple"}
              onMouseOut={({target})=>target.style.color="orange"}
            />
          </Link>
        : '')
      }{p.name} · {p.year}
    </h2>
    <Link to={"/project/"+p.key}>
      <p className={p.key === '1' ? "glow-on-hover" : ""}>
        {p.description}
      </p>
    </Link>
    {/* {(() => {
      id ? '' : ''
    })()} */}
  </div>)
}