import JSON5 from "json5";
import { readFile, writeFile } from "fs";

let folder =
  "/Users/DRWV74/pet/vp_sog_converter/videopsalm_to_sog_converter/js_converter";
let inputFile = "nowa_pesn.json";
let outputFile = "nowa_piesn_formatted.json";

readFile(`${folder}/${inputFile}`, (err, data) => {
  if (err) {
    console.log(err);
  } else {
    console.log("Reading file...");

    const preparedData = data.toString().replace(/(\r\n|\n|\r)/gm, "");
    const json_5 = JSON5.parse(preparedData);
    const json_norm = JSON.stringify(json_5);

    console.log("Writing file...");

    writeFile(`${folder}/${outputFile}`, json_norm, (err, data) => {
      if (err) {
        console.log(err);
      } else {
        console.log("File written");
      }
    });
  }
});

/** How to use JSON6
    import JSON6 from "json-6";
 
    const json_6 = JSON6.parse(data.toString());
    const json = JSON.stringify(json_6);
    console.log(json);
*/
