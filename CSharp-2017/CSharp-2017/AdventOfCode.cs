using System;

namespace CSharp_2017
{
    internal static class AdventOfCode
    {
        private static void Main(string[] args)
        {
            Console.WriteLine("Question 1:");
            Console.WriteLine(Question1.ReverseCaptcha(Parser.ToIntList(PuzzleInputs.Q1)));
            Console.WriteLine(Question1.ReverseCaptchaWithHalfway(Parser.ToIntList(PuzzleInputs.Q1)));
        }
    }
}