using System;
using CSharp_2017.Solutions;
using CSharp_2017.Support;

namespace CSharp_2017
{
    internal static class AdventOfCode
    {
        private static void Main(string[] args)
        {
            Console.WriteLine("Question 1:");
            Console.WriteLine(Question1.ReverseCaptcha(IntListParser.FromGlob(PuzzleInputs.Q1)));
            Console.WriteLine(Question1.ReverseCaptchaWithHalfway(IntListParser.FromGlob(PuzzleInputs.Q1)));
            Console.WriteLine("Question 2:");
            Console.WriteLine(Question2.SpreadsheetChecksum(PuzzleInputs.Q2));
        }
    }
}