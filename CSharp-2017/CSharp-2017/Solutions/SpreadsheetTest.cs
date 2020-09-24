using System.Collections.Generic;
using System.Globalization;
using System.Security;
using CSharp_2017.Support;
using Xunit;

namespace CSharp_2017.Solutions
{
    public class SpreadsheetTest
    {
        [Fact]
        public void ShouldParseASpreadsheet()
        {
            var spreadsheetText = @"5	1	9	5
7	5	3
2	4	6	8";

            var spreadsheet = Spreadsheet.From(spreadsheetText);

            Assert.Equal(3, spreadsheet.Rows.Count);
            // Assert.Equal(spreadsheet.Rows[0], new Spreadsheet.Row(new List<int> {5, 1, 9, 5}));
        }
    }

    public class RowTest
    {
        [Fact]
        public void ShouldCalculateDivisibilityChecksum()
        {
            var row = new Spreadsheet.Row(new List<int> {5, 9, 2, 8});

            var actual = row.ChecksumDivisibility();
            var expected = 4;

            Assert.Equal(expected, actual);
        }

        [Fact]
        public void ShouldNotCompareTwoOfTheSame()
        {
            var row = new Spreadsheet.Row(new List<int> {5, 9, 9, 2, 8});

            var actual = row.ChecksumDivisibility();
            var expected = 4;

            Assert.Equal(expected, actual);
        }
    }
}