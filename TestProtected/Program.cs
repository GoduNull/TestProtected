using System;

namespace TestProtected
{
    class Program
    {
        static void Show()
        {
            Console.WriteLine("Enter the number");

            if (int.TryParse(Console.ReadLine(), out var inputNumber))
            {
                PrimeNumbers(inputNumber);
            }
            else
            {
                Console.WriteLine("Not a number");
            }

            Console.WriteLine("Continue? Y - yes, Any - no");

            if (Console.ReadKey().Key == ConsoleKey.Y)
            {
                Console.WriteLine();
                Show();
            }
        }
        static bool IsSimple(int n)
        {
            if (n >= 2)
            {
                for (int i = 2; i <= n / 2; i++)
                {
                    if (n % i == 0)
                        return false;
                }
                return true;
            }
            return false;
        }
        static void PrimeNumbers(int num)
        {
            bool result = false;
            int number1 = 2;
            int number2 = 3;
            int number3 = 5;

            for (int i = number3; num > (number1 * number2 * number3); i += 2)
            {
                if (IsSimple(i))
                {
                    number3 = i;
                    if ((number1 * number2 * number3) == num)
                    {
                        result = true;
                        break;
                    }
                    else
                    {
                        number1 = number2;
                        number2 = number3;
                    }
                }
            }

            if (result) Console.WriteLine($"Yes, {number1} * {number2} * {number3} = {num}");
            else Console.WriteLine("No");
        }

        static void Main(string[] args)
        {
            Show();
        }
    }
}
