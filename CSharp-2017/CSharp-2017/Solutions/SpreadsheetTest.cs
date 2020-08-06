using System.Collections.Generic;
using CSharp_2017.Support;
using NUnit.Framework;

namespace CSharp_2017.Solutions
{
    public class SpreadsheetTest
    {
        [Test]
        public void ShouldParseASpreadsheet()
        {
            var spreadsheetText = @"5	1	9	5
7	5	3
2	4	6	8";

            var spreadsheet = Spreadsheet.From(spreadsheetText);

            Assert.AreEqual(spreadsheet.rows.Count, 3);
            Assert.AreEqual(spreadsheet.rows[0], new List<int> {5, 1, 9, 5});
        }
    }
}