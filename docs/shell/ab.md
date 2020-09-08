# ab

ab is a tool for benchmarking your Apache HTTP server. It especially shows you how many requests per second your Apache installation is capable of serving.

For example:

```sh
$ ab -c 10 -t 3 http://localhost:8001/
```

## OPTIONS

`-c concurrency`, Number of multiple requests to perform at a time. Default is one request at a time.

`-t timelimit`, Maximum number of seconds to spend for benchmarking. This implies a `-n 50000` internally. Use this to benchmark the server within a fixed total amount of time. Per default there is no timelimit.

`-n requests`, Number of requests to perform for the benchmarking session. The default is to just perform a single request which usually leads to non-representative benchmarking results.
