using System;

namespace CSharp_2017
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Question 1:");
            Console.WriteLine(Question1.ReverseCaptcha(Parser.ToIntList(PuzzleInputs.Q1)));
        }
    }
}