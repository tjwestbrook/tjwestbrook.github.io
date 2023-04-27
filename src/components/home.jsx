import React ,{ useEffect, useState } from 'react';
import { HiDocumentDownload } from "react-icons/hi";
import { useAxios } from '../utils';
import Resume from './resume';

export default function Home() {
  // const [proPic, setProPic] = useState(new Blob())
  const [profile, setProfile] = useState({})
  const [bio, setBio] = useState([])
  const response = useAxios()
  // const imgResponse = useAxios('/profilepicture', {responseType: 'blob'})
  
  useEffect(() => {
    // (async () => await imgResponse
    // .then(res => {
    //   const binaryData = [res.data]
    //   const img = window.URL.createObjectURL(new Blob(binaryData))
    //   setProPic(img)
    // })
    // .catch(err => console.log(err)))();
    (async () => await response.then(res => res.data)
      .then(data => { setProfile(data); setBio(data.bio) })
      .catch(err => console.log(err)))();
    return () => { /*setProPic(new Blob());*/ setProfile({}); setBio([]); };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  return <div className="home">
    <header>
      {/* <img src={proPic} alt="Profile" /> */}
      <h1><code>{profile.title}</code></h1>
    </header>
    <body>
      <ul className="nobullet-nows">
        <p>{bio.map((b,i)=><li key={i.toString()}>{b}</li>)}</p>
      </ul>
      <p>{profile.message}</p>
      <details>
        <summary>
          <h3 style={{display: "inline"}}> Resume: </h3>
          <a href="https://drive.google.com/uc?export=download&id=145FvWPfjZAXzMU1ZskQmizeQV5c9q1a7" target="_blank" rel="noreferrer">
            <HiDocumentDownload alt="Resume"
              onMouseOver={({target})=>target.style.color="black"}
              onMouseOut={({target})=>target.style.color="white"}
            />
          </a>
        </summary>
        <Resume />
      </details>
    </body>
  </div>
};