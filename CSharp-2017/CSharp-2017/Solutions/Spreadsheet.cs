using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;
using System.Runtime.CompilerServices;
using CSharp_2017.Support;

namespace CSharp_2017.Solutions
{
    public class Spreadsheet
    {
        public class Row
        {
            private readonly List<int>
                _cells;

            public Row(List<int> cells)
            {
                _cells = cells;
            }

            public int ChecksumDifference()
            {
                return _cells.Max() - _cells.Min();
            }

            public int ChecksumDivisibility()
            {
                var sorted = _cells.ToImmutableSortedSet();

                for (var biggerIndex = sorted.Count - 1; biggerIndex > 0; biggerIndex--)
                {
                    var biggerNumber = sorted[biggerIndex];
                    for (var smallerIndex = biggerIndex - 1; smallerIndex >= 0; smallerIndex--)
                    {
                        var smallerNumber = sorted[smallerIndex];
                        if (biggerNumber % smallerNumber == 0)
                        {
                            return biggerNumber / smallerNumber;
                        }
                    }
                }

                throw new Exception("No divisible pairs found " + _cells);
            }
        }

        public List<Row> Rows { get; }

        private Spreadsheet(List<Row> rows)
        {
            Rows = rows;
        }


        public static Spreadsheet From(string spreadsheetText)
        {
            var strings = spreadsheetText.Split('\n');

            var rows = strings
                .Select(IntListParser.FromTabSeparated)
                .Select(it => new Row(it))
                .ToList();
            return new Spreadsheet(rows);
        }


        public double Checksum()
        {
            return Rows.Select(it => it.ChecksumDifference()).Sum();
        }
        
        
        public double ChecksumDivisibility()
        {
            return Rows.Select(it => it.ChecksumDivisibility()).Sum();
        }
    }
}