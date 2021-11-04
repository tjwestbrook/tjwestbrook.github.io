import React from 'react';

export default function Home() {
  return <>
    <header>
      <h1>hello, Friend 👋🏾</h1>
      <p>welcome to my portfolio 🧔🏾</p>
    </header>
    <body>
    <p>
      <ul style={{ listStyleType: "none", whiteSpace: "nowrap", padding: 0, margin: 0 }}>
        <li>my name is Taylore J. Westbrook 🤘🏾</li>
        <li>im a data engineer at Travelers in Hartford, CT 💻</li>
        <li>this is an interactive audit of my CS projects 🖱⌨</li>
      </ul>
    </p>
    {// Career Page
    /*
    <p>
      <dl>
        <dt> Position Title Company Location, Timeframe </dt>
        <dd>
          <details>
              <summary>Details/Responsibilities</summary>
              <ul>
                <li></li>
              </ul>
          </details>
        </dd>

        <dt></dt>
        <dd><details><summary>
        <ul><li>...</li></ul>
        </summary></details></dd>

        </dl>
    </p>
    */}
    </body>
  </>
};