#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#include <syscalls.h>
#include <sos.h>

static void dump_clock_gettime(void)
{
    struct timespec now;
    if (clock_gettime(CLOCK_REALTIME, &now) == -1) {
        perror("clock_gettime");
        return;
    }

    printf("[clock_test] realtime: %" PRIu64 ".%09ld s\n",
           (uint64_t)now.tv_sec, now.tv_nsec);
}

static void run_periodic_test(void)
{
    const int iterations = 10;
    const int period_ms = 100;
    struct timespec sleep_ts = {
        .tv_sec = 0,
        .tv_nsec = period_ms * 1000 * 1000,
    };

    struct timespec start;
    if (clock_gettime(CLOCK_MONOTONIC, &start) == -1) {
        perror("clock_gettime");
        return;
    }
    struct timespec prev = start;

    printf("[clock_test] starting %d iterations with %d ms nanosleep()\n",
           iterations, period_ms);

    for (int i = 1; i <= iterations; ++i) {
        if (nanosleep(&sleep_ts, NULL) == -1) {
            perror("nanosleep");
            return;
        }

        struct timespec now;
        if (clock_gettime(CLOCK_MONOTONIC, &now) == -1) {
            perror("clock_gettime");
            return;
        }

        uint64_t delta_ns =
            (uint64_t)(now.tv_sec - prev.tv_sec) * 1000000000ull +
            (uint64_t)(now.tv_nsec - prev.tv_nsec);
        uint64_t total_ns =
            (uint64_t)(now.tv_sec - start.tv_sec) * 1000000000ull +
            (uint64_t)(now.tv_nsec - start.tv_nsec);

        printf("[clock_test] tick %d: delta=%" PRIu64 " us total=%" PRIu64 " us\n",
               i, delta_ns / 1000ull, total_ns / 1000ull);

        prev = now;
    }
}

static void run_mixed_intervals(void)
{
    const struct {
        const char *label;
        int delay_ms;
    } tests[] = {
        { "short", 30 },
        { "medium", 75 },
        { "long", 150 },
    };

    for (size_t i = 0; i < sizeof(tests) / sizeof(tests[0]); ++i) {
        struct timespec before;
        if (clock_gettime(CLOCK_MONOTONIC, &before) == -1) {
            perror("clock_gettime");
            return;
        }

        struct timespec ts = {
            .tv_sec = tests[i].delay_ms / 1000,
            .tv_nsec = (tests[i].delay_ms % 1000) * 1000 * 1000,
        };
        if (nanosleep(&ts, NULL) == -1) {
            perror("nanosleep");
            return;
        }

        struct timespec after;
        if (clock_gettime(CLOCK_MONOTONIC, &after) == -1) {
            perror("clock_gettime");
            return;
        }

        uint64_t elapsed_ns =
            (uint64_t)(after.tv_sec - before.tv_sec) * 1000000000ull +
            (uint64_t)(after.tv_nsec - before.tv_nsec);

        printf("[clock_test] %s interval requested %d ms, elapsed=%" PRIu64 " us\n",
               tests[i].label, tests[i].delay_ms, elapsed_ns / 1000ull);
    }
}

int main(void)
{
    sosapi_init_syscall_table();

    puts("[clock_test] hello from clock driver test app");

    dump_clock_gettime();
    run_periodic_test();
    run_mixed_intervals();

    puts("[clock_test] done");

    return 0;
}
