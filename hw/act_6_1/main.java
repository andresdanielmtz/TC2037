public class Main {
    static int factorial(int num) {
        long startTime = System.nanoTime();
        if (num == 0) { return 1; }
        int counter = 1;

        for (int i = 1; i <= num; i++) {
            counter = counter * i;
        }
        long stopTime = System.nanoTime();
        System.out.printf("(For Loop Method): %8s\n", stopTime - startTime);
        return counter;
    }

    static int factorial_recursive(int num) {
        if (num == 0) { return 1; }
        return (num * factorial_recursive((num - 1)));

    }

    static void factorial_recursive_time_method(int num) {
        long startTime = System.nanoTime();
        factorial_recursive(num);
        long stopTime = System.nanoTime();
        System.out.printf("(Recursive Method): %8s\n", stopTime - startTime);
    }

    public static void main(String[] args) {
        System.out.println("Hello world!");
        int testing_variable = 4;

        factorial(testing_variable);
        factorial_recursive_time_method(testing_variable);

    }
}
