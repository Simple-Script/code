using System;

class Program
{
    static void Main()
    {
        TimeZoneInfo cstZone = TimeZoneInfo.FindSystemTimeZoneById("Central Standard Time");
        DateTime cstTime = TimeZoneInfo.ConvertTime(DateTime.Now, cstZone);
        Console.WriteLine("Current time in CST: " + cstTime.ToString("yyyy-MM-dd HH:mm:ss"));
    }
}
