echo =======collecting commit SHAs=======
git log --oneline -50 > last_50_commits
echo =======starting=======
cat last_50_commits | while read line; do
	cur=$(echo $line | cut -d ' ' -f 1)
	echo ====working on commit $cur======
	git checkout -f $cur
	rm tests/test_dynamic_window_approach.py  # This test appears in some commits and occasionally hangs
	pip install -r requirements.txt
	#cp ../../conftest.py ./
	python3 -m pytest -s > ${cur}_no_tcp.log
        grep "current test FAILED" ${cur}_no_tcp.log | cut -d , -f 1 | cut -d ' ' -f 5,6,7,8 | rev | cut -c 2- | rev > ${cur}_no_tcp_result.log
        python3 -m pytest --tcp --tcp-weight=1-0 -s > ${cur}_tcp_1-0.log
	grep "current test FAILED" ${cur}_tcp_1-0.log | cut -d , -f 1 | cut -d ' ' -f 5,6,7,8 | rev | cut -c 2- | rev > ${cur}_tcp_1-0_result.log
	python3 -m pytest --tcp --tcp-weight=0.5-0.5 -s > ${cur}_tcp_0.5-0.5.log
        grep "current test FAILED" ${cur}_tcp_0.5-0.5.log | cut -d , -f 1 | cut -d ' ' -f 5,6,7,8 | rev | cut -c 2- | rev > ${cur}_tcp_0.5-0.5_result.log
	python3 -m pytest --tcp --tcp-weight=0-1 -s > ${cur}_tcp_0-1.log
        grep "current test FAILED" ${cur}_tcp_0-1.log | cut -d , -f 1 | cut -d ' ' -f 5,6,7,8 | rev | cut -c 2- | rev > ${cur}_tcp_0-1_result.log
done
