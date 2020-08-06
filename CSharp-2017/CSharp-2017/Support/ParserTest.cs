using System.Collections.Generic;
using NUnit.Framework;

namespace CSharp_2017
{
    public class ParserTest
    {
        [Test]
        public void ShouldParseABasicStringIntoAListOfIntegers()
        {
            var questionTest = "1234";
            var expectedOutput = new List<int> {1, 2, 3, 4};

            var sum = Parser.ToIntList(questionTest);

            Assert.AreEqual(sum, expectedOutput);
        }
    }
}