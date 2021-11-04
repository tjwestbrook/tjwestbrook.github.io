import React from "react";

export default function PolyWind() {
  return (<>
    <head>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/brython/3.7.5/brython.min.js" />
    </head>
    <script type="text/python" onLoad="brython()">
    {/* <!-- ... and the rest of the body as before ... --> */}
      from browser import document
      def main():
        document["id"].bind("")
    </script>
  </>)
}