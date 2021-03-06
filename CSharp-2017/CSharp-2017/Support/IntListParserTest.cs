using System.Collections.Generic;
using Xunit;
using Assert = NUnit.Framework.Assert;

namespace CSharp_2017.Support
{
    public class ParserTest
    {
        [Fact]
        public void ShouldParseABasicStringIntoAListOfIntegers()
        {
            var questionTest = "1234";
            var expectedOutput = new List<int> {1, 2, 3, 4};

            var sum = IntListParser.FromGlob(questionTest);

            Assert.AreEqual(sum, expectedOutput);
        }

     
    }
}