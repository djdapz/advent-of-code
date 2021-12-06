export const readNumberList = (input: string): number[] => {
  return input.split('\n')
    .map(it => parseInt(it.trim()))
    .filter(it => !isNaN(it));
};

export const readStringList = (input: string): string[] => {
  return input.split('\n');
};
