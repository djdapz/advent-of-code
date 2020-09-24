using System.Collections.Generic;
using Xunit;
using Assert = NUnit.Framework.Assert;

namespace CSharp_2017.Solutions
{
    public class Question1Test
    {
        [Fact]
        public void ShouldCalculateZeroWhenNothingRepeats()
        {
            var nonRepeatingList = new List<int> {2, 3, 7};
            const int expectedSum = 0;

            var sum = Question1.ReverseCaptcha(nonRepeatingList);

            Assert.AreEqual(sum, expectedSum);
        }

        [Fact]
        public void ShouldCalculateSumWhenNumbersRepeat()
        {
            var nonRepeatingList = new List<int> {1, 1, 2, 2};
            const int expectedSum = 3;

            var sum = Question1.ReverseCaptcha(nonRepeatingList);

            Assert.AreEqual(sum, expectedSum);
        }

        [Fact]
        public void ShouldIncludeNumbersHalfWayAroundTheBend()
        {
            var nonRepeatingList = new List<int> {1, 2, 1, 2};
            const int expectedSum = 6;

            var sum = Question1.ReverseCaptchaWithHalfway(nonRepeatingList);

            Assert.AreEqual(sum, expectedSum);
        }


        [Fact]
        public void ShouldIncludeNumbersHalfWayAroundTheBend_1()
        {
            var nonRepeatingList = new List<int> {1, 2, 2, 1};
            const int expectedSum = 0;

            var sum = Question1.ReverseCaptchaWithHalfway(nonRepeatingList);

            Assert.AreEqual(sum, expectedSum);
        }
    }
}