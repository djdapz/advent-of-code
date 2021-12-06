import * as fs from 'fs';
import { accessSync, constants } from 'fs';
import { dirname } from 'path';

export const readFile = (name: string, directory: string = 'files/'): string => {
  let rootOfProject = getAppPath();
  return fs.readFileSync(rootOfProject + '/' + directory + name).toString().trim();
};

function getAppPath() {

  for (let path of module.paths) {
    try {
      accessSync(path, constants.F_OK);
      return dirname(path);
    } catch (e) {
      // Just move on to next path
    }
  }
}
