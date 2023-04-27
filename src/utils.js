import axios from "axios";
import { useRef, useState } from "react";
import { useLocation } from "react-router-dom";
import c from "./constants";

export function HoverComponent(defaultColor, hoverColor) {
  const elementRef = useRef()
  const hovered = useHover(elementRef)
  return <div ref={elementRef}
    style={{ backgroundColor: hovered ? hoverColor : defaultColor }} />
}

function useHover(ref) {
  const [hovered, setHovered] = useState(false)
  ref.useEventListener("mouseover", () => setHovered(true), ref.current)
  ref.useEventListener("mouseout", () => setHovered(false), ref.current)
  return hovered
}

export function useAxios(PATH, HEADERS, TYPE, DATA) {
  const location = useLocation()
  // PATH = c.DETA + (PATH ? PATH : location.pathname)
  PATH = c.LOCAL + (PATH ? PATH : location.pathname)
  switch(TYPE) {
    case "DELETE": return axios.delete(PATH, HEADERS, DATA)
    case "PUT": return axios.put(PATH, HEADERS, DATA)
    case "POST": return axios.post(PATH, HEADERS, DATA)
    case "PATCH": return axios.patch(PATH, HEADERS, DATA)
    case "GET": return axios.get(PATH, HEADERS)
    default: return axios.get(PATH)
  }
}