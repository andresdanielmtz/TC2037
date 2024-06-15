// See https://aka.ms/new-console-template for more information
Console.WriteLine("Hello, World!");

int FactorialRecursive(int num)
{
    if (num == 0)
    {
        return 1; 
    }

    return (num * FactorialRecursive(num - 1));
}

void FactorialWrapper(int num)
{
    var watch = System.Diagnostics.Stopwatch.StartNew();
    FactorialRecursive(num); 
    watch.Stop();
    var elapsedMs = watch.Elapsed.TotalMilliseconds;
    Console.WriteLine($"Factorial (Recursive): {elapsedMs}");
}

int Factorial(int num)
{
    var watch = System.Diagnostics.Stopwatch.StartNew();

    int counter = 1;
    for (int i = 1; i <= num; i++)
    {
        counter *= i;
    }
    watch.Stop();
    var elapsedMs = watch.Elapsed.TotalMilliseconds;
    Console.WriteLine($"Factorial (For Loop): {elapsedMs}"); 

    return counter;
}

int testingNumber = 4;
int result = Factorial(testingNumber);
FactorialWrapper(testingNumber);