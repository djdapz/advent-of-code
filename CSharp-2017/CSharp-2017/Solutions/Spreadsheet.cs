using System.Collections.Generic;
using System.Linq;
using CSharp_2017.Support;

namespace CSharp_2017.Solutions
{
    public class Spreadsheet
    {
        public List<List<int>> rows { get; }

        public Spreadsheet(List<List<int>> rows)
        {
            this.rows = rows;
        }


        public static Spreadsheet @From(string spreadsheetText)
        {
            var strings = spreadsheetText.Split('\n');
            
            var rows = strings
                .Select(IntListParser.FromTabSeparated)
                .ToList();
            return new Spreadsheet(rows);
        }

        private static double RowChecksum(List<int> nonRepeatingList)
        {
            return nonRepeatingList.Max() - nonRepeatingList.Min();
        }

        public double Checksum()
        {
            return rows.Select(RowChecksum).Sum();
        }
    }
}