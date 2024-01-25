# memray Results
Here are the logs for running `pytest-tcp` on `https://github.com/bloomberg/memray`

Notice that the scripts should be run after `cd` into the `test` folder located in the `memray`'s root directory.

`xxxxxx_no_tcp.log` is the log of running `pytest` without `tcp` on commit `xxxxxx`.

`xxxxxx_no_tcp_result.log` is the record of test failures as well as the time elapsed before detecting each of them when running `pytest` without `tcp` on commit `xxxxxx`.

`xxxxxx_tcp_a-b.log` is the log of running `pytest` with `tcp` on commit `xxxxxx` using the `a-b` herustic.

`xxxxxx_tcp_a-b_result.log` is the record of test failures as well as the time elapsed before detecting each of them when running `pytest` with `tcp` on commit `xxxxxx`.
