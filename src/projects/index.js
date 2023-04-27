// import PolyWind from "./3/polywind.py";
// import SudokuAI from "./2/sudokuai.cpp"
import PuzzlePride from "./1/sketch";
import Pong from "./0/sketch";

const Projects = [
  /*{
    name: "PolyWind",
    component: PolyWind
  },{
    name: "SudokuAI",
    component: SudokuAI
  },*/{
    name: "Puzzle Pride",
    component: PuzzlePride
  },{
    name: "Pong",
    component: Pong
  },
];

Projects.forEach((P,i,Ps) => P.path = P.name.toLowerCase().replace(/\s/g,''));

export default Projects;