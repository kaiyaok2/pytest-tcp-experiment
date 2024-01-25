import time
import pytest

total = 0
groups = {}

@pytest.fixture(autouse=True)
def run_around_tests(request):
    start = time.time()
    failed_count = request.session.testsfailed
    yield
    end = time.time()

    global total
    duration = end - start
    total += duration
    if request.session.testsfailed > failed_count:
        print(f'\ncurrent test FAILED -- {request.function.__name__} in {str(request.node.fspath)}: {total}s cumulative, {duration}s individual\n')
    else:
        print(f'\ncurrent test PASSED/SKIPPED -- {request.function.__name__} in {str(request.node.fspath)}: {total}s cumulative, {duration}s individual\n')
