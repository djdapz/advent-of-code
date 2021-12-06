import { readFile } from './fileReader';

describe('file reader', () => {
  it('should read a test file', () => {
    let result = readFile('test.txt');
    expect(result).toContain('hello world from test');
  });

  it('should trim empty lines', () => {
    let result = readFile('file_with_empty_lines.txt', 'test/');
    expect(result).toEqual('hi\nthere');
  });
});
