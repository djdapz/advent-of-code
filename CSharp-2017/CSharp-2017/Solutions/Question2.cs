using System.Collections.Generic;
using System.Linq;

namespace CSharp_2017.Solutions
{
    public static class Question2
    {

        public static double SpreadsheetChecksum(string spreadsheet)
        {
            return Spreadsheet.From(spreadsheet).Checksum();
        }
        
        
        public static double SpreadsheetChecksumDivisibility(string spreadsheet)
        {
            return Spreadsheet.From(spreadsheet).ChecksumDivisibility();
        }
    }
}