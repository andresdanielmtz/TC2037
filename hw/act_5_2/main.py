import time
import threading
import math

LIMIT = 5_000_000


def is_prime(n: int) -> bool:
    if n < 2:
        return False
    upper_limit = math.isqrt(n) + 1
    for i in range(2, upper_limit):
        if n % i == 0:
            return False
    return True


def sequencial_method(n: int) -> None:
    counter = 0
    for i in range(n):
        if is_prime(i):
            counter += i
    ellapsed_time = time.process_time()
    print(f"Elapsed Time (Sequential): {ellapsed_time}")
    print(f"Final result: {counter}")


def parallel_method(
    lower_limit: int, upper_limit: int, result: list[int], index: int
) -> None:
    counter = 0
    for i in range(lower_limit, upper_limit):
        if is_prime(i):
            counter += i
    result[index] = counter


def parallel_general() -> None:
    thread_ranges = [
        (0, 1_250_000),
        (1_250_000, 2_500_000),
        (2_500_000, 3_750_000),
        (3_750_000, 5_000_000),
    ]

    threads = []
    results = [0] * len(thread_ranges)
    start_time = time.process_time()

    for i in range(len(thread_ranges)):
        thread = threading.Thread(
            target=parallel_method,
            args=(thread_ranges[i][0], thread_ranges[i][1], results, i),
        )
        threads.append(thread)
        thread.start()

    for thread in threads:
        thread.join()
    total_counter = sum(results)
    elapsed_time = time.process_time() - start_time
    print(f"Elapsed Time (Parallelism): {elapsed_time}")
    print(f"Final result: {total_counter}")


parallel_general()
sequencial_method(LIMIT)
