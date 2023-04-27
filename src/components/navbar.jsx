
/* eslint-disable react/jsx-no-target-blank */
import React from "react";
import { Link, NavLink, useLocation } from "react-router-dom";
import { IconContext } from "react-icons/lib";
// import { AiOutlineNumber } from "react-icons/ai";
import { BiMailSend } from "react-icons/bi";
import { CgCode, CgCodeSlash } from "react-icons/cg";
import { FaGithub, /*FaDrawPolygon*/ } from "react-icons/fa";
import { RiHomeLine, RiPingPongFill } from "react-icons/ri";
import { SiPolywork, SiAboutdotme, SiLinkedin } from "react-icons/si";
// import { ReactComponent as Logo } from './logo.svg';
import c from "../constants";
import Projects from "../projects";

export default function Navbar() {
  const smallScreen = () => window.innerWidth < 500
  const tab = () => smallScreen ? ['Home','Projects','About'] : ['','','']
  return <IconContext.Provider value={{ size: "2rem" }}>
    <nav className="navbar">
      <div className="nav-item">
        <NavLink to="/" className="nav-home"
          activeClassName={useLocation().pathname === "/" ? 'active' : ''}>
          <RiHomeLine />
        </NavLink>
        <NavLink to="/projects" className="nav-projects">
          <CgCode />{c.space}{tab()[1]}{c.space}<CgCodeSlash />
          <div className="nav-project">
            {Projects.map((P,i) =>
            <Link to={"/"+P.path}>
              {(() => <div className="project-icon"> {[
                // <FaDrawPolygon />, // Poly Wind
                // <AiOutlineNumber />, // Sudoku AI
                <SiPolywork />, // Puzzle Pride
                <RiPingPongFill /> // Pong
              ][i]}</div>)()}{c.space}{P.name}
            </Link>)}
          </div>
        </NavLink>
        <NavLink to="/about" className="nav-about">
        {tab()[2]}{c.space}<SiAboutdotme className={smallScreen()?'sm':'lg'}/>
        </NavLink>
      </div>
      <div className="nav-icon">
        <a href="mailto:taylorejwestbrook@gmail.com?subject=GitHub%20Portfolio" target="_blank">
          <BiMailSend
            onMouseOver={({target})=>target.style.color="black"}
            onMouseOut={({target})=>target.style.color="white"}
          />
        </a>{c.space}
        <a href="https://linkedin.com/in/taylorejwestbrook/" target="_blank">
          <SiLinkedin
            onMouseOver={({target})=>target.style.color="#0072b1"}
            onMouseOut={({target})=>target.style.color="white"}
          />
        </a>{c.space}
        <a href="https://github.com/tjwestbrook" target="_blank">
          <FaGithub
            onMouseOver={({target})=>target.style.color="#171515"}
            onMouseOut={({target})=>target.style.color="white"}
          />
        </a>{c.space}
      </div>
    </nav>
  </IconContext.Provider>
};