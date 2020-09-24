using System.Collections.Generic;
using System.Linq;
using Xunit;

namespace CSharp_2017.Solutions
{
    public class Question3Test
    {
        [Fact]
        public void ShouldGetClosestOddSquare()
        {
            Assert.Equal(9, Question3.NextOddSquare(9));
            Assert.Equal(25, Question3.NextOddSquare(10));
            Assert.Equal(25, Question3.NextOddSquare(19));
            Assert.Equal(25, Question3.NextOddSquare(25));
            Assert.Equal(49, Question3.NextOddSquare(26));
        }
    }
}