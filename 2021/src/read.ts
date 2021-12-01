export const readNumberList = (input: string): number[] => {
  return input.split('\n')
    .map(it => parseInt(it.trim()))
    .filter(it => !isNaN(it));
};
