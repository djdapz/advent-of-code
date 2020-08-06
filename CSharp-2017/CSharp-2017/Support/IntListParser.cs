using System.Collections.Generic;
using System.Linq;
using CSharp_2017.Solutions;

namespace CSharp_2017.Support
{
    public class IntListParser
    {
        public static List<int> FromGlob(string input) =>
            input.ToCharArray()
                .Select(char.ToString)
                .Select(int.Parse)
                .ToList();

        public static List<int> FromTabSeparated(string input) =>
            input.Split('\t')
                .Select(int.Parse)
                .ToList();
    }
}