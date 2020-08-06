using System;
using System.Collections.Generic;
using System.Linq;

namespace CSharp_2017
{
    public class Question1
    {
        public static int ReverseCaptcha(List<int> numbers) =>
            numbers
                .Where((t, i) =>
                {
                    var nextIndex = (i + 1) % numbers.Count;
                    return t == numbers[nextIndex];
                })
                .Sum();

        public static int ReverseCaptchaWithHalfway(List<int> numbers) =>
            numbers
                .Where((t, i) =>
                {
                    var halfwayIndex = (i + (numbers.Count / 2)) % numbers.Count;
                    return t == numbers[halfwayIndex];
                })
                .Sum();
    }
}