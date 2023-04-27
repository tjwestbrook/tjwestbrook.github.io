import React, { useEffect, useState } from 'react';
import { useAxios } from '../utils';
import c  from '../constants';

export default function Resume() {
  const [resume, setResume] = useState({})
  const response = useAxios('/resume')

  useEffect(() => {
    (async () => await response
    .then(res => setResume(res.data))
    .catch(err => console.log(err)))();
    return () => setResume({});
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return <div className="CV"> {Object.keys(resume).slice(0).reverse().map(sect =>
    <div className={sect}>
      <h2>{sect}</h2>
      {Object.keys(resume[sect]).slice(0).reverse().map(part =>
        <div style ={{ background: "rgba(69, 69, 69, 0.6)",
          padding: "1rem", margin: "0.1rem", borderRadius: "1rem"
        }}>
          <h2 style={{fontSize: "0.8rem", whiteSpace: 'normal'}}>{part}</h2>
          {sect === 'Skills' ? Object.keys(resume[sect][part]).map(skl =>
            <ul className="nobullet">
              {part === 'Frameworks' ? <>
                <h3 style={{fontSize:"0.7rem"}}>{skl}</h3>
                {Object.keys(resume[sect][part][skl]).map(t =>
                  <li style={{fontSize: "0.7rem"}}>{resume[sect][part][skl][t]}</li>
                )} </>
              : <li style={{fontSize: "0.7rem"}}>{resume[sect][part][skl]}</li>
              }
            </ul>
          ) : sect === 'Education' ? Object.keys(resume[sect][part]).map(deg =>
            <ul className="nobullet">
                <li style={{fontSize: "0.6rem"}}>
                  <b>{deg}</b>:{c.space}{resume[sect][part][deg]}
                </li>
            </ul>
          ) : sect === 'Experience' ? Object.keys(resume[sect][part]).map(co =>
            <div style={{fontSize: "0.6rem"}}>
              {co === 'Responsibilities' ?
                <details>
                  <summary><b>{co}</b>:</summary>
                  {resume[sect][part][co].map(r => <li>{r}</li>)}
                </details>
                : <span><b>{co}</b>: {resume[sect][part][co]}</span>
              }
            </div>
          ) : ''}
        </div>
      )}
    </div>
  )}</div>
};