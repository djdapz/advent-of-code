using System.Collections.Generic;
using Xunit;
using Assert = NUnit.Framework.Assert;

namespace CSharp_2017.Solutions
{
    public class Question2Test
    {
        [Fact]
        public void ShouldSumTogetherChecksumForEachRow()
        {
            var spreadsheet = @"5	1	9	5
5	2	3	1";
                
            const int expectedChecksum = 8 + 4;

            var sum = Question2.SpreadsheetChecksum(spreadsheet);

            Assert.AreEqual(expectedChecksum, sum);
        }
    }
}