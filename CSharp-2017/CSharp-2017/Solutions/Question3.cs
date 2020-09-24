using System.Collections.Generic;
using System.Linq;

namespace CSharp_2017.Solutions
{
    public static class Question3
    {
        public static int NextOddSquare(int number)
        {
            var runningClosest = 1;
            while ((runningClosest) * (runningClosest) < number)
            {
                runningClosest += 2;
            }

            return runningClosest * runningClosest;
        }
    }
}