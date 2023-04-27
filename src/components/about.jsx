import React, { useEffect, useState } from 'react';
import { useAxios } from '../utils';

export default function About() {
  const [About, setAbout] = useState([])
  const response = useAxios()
  useEffect(() => {
    (async () => await response
    .then(res => setAbout(res.data))
    .catch(err => console.log(err))
    )();
    return () => setAbout([]);
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])
  return Object.keys(About).map((topic) => <>
    <h3>{topic}</h3>
    <ul class="nobullet">
      <p>{About[topic].map(l => <li>{l}</li>)}</p>
    </ul>
  </>)
};