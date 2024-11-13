using System;
using System.Diagnostics;

class Program
{
    static void Main(string[] args)
    {
        string exePath = @"C:\Path\To\YourExecutable.exe";
        Process.Start(exePath);
    }
}
