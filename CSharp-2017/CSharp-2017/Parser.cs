using System;
using System.Collections.Generic;
using System.Linq;

namespace CSharp_2017
{
    public class Parser
    {
        public static List<int> ToIntList(string input) =>
            input.ToCharArray()
                .Select(char.ToString)
                .Select(int.Parse)
                .ToList();
    }
}