/* eslint-disable react/jsx-no-target-blank */
import React from "react";
import { Link, NavLink } from "react-router-dom";
import { RiHomeLine } from "react-icons/ri"
import { CgCode, CgCodeSlash } from "react-icons/cg"
import { FaGithub } from "react-icons/fa"
import { SiLinkedin } from "react-icons/si"
import { IconContext } from "react-icons/lib";

export default function Navbar() {
  const space = <span>&nbsp;</span>;
  return (
    <IconContext.Provider value={{ size: "2rem" }}>
      <nav className="navbar">
        <div className="nav-item">
          <NavLink to="/" > <RiHomeLine /> </NavLink>
          <NavLink to="/projects" className="nav-projects">
            <CgCode />{space}Projects{space}<CgCodeSlash />
            <div className="nav-project">
              <Link to="/puzzlepride">Puzzle Pride</Link>
              <Link to="/pong">Pong</Link>
            </div>
          </NavLink>
        </div>
        
        <span className="icons">
          <a href="https://linkedin.com/in/taylore-westbrook/" target="_blank">
            <SiLinkedin
              onMouseOver={({target})=>target.style.color="#0072b1"}
              onMouseOut={({target})=>target.style.color="white"}
            /></a>{space}
          <a href="https://github.com/tjwestbrook" target="_blank">
            <FaGithub
              onMouseOver={({target})=>target.style.color="#171515"}
              onMouseOut={({target})=>target.style.color="white"}
            /></a>{space}
        </span>
      </nav>
    </IconContext.Provider>
  )
};