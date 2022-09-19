
for bench in  100.test-pcce-fig-4 \
    101.test-pcce-fig-5a \
    102.test-indirect-call \
    103.test-libc-nostatic-nodebug \
    103.test-libc-static-nodebug \
    103.test-libc-static-debug \
    104.test-backedge \
    105.test-functionname \
    106.test-machinecode
do
    $drrun -t ccw_test -ccw /home/sungkeun/git/DCCE/output/dcce/ccweight/${bench}.ccw -- /home/sungkeun/git/DCCE/output/dcce/ccweight/${bench}
    #$drrun -t ccw_test -ccw /home/sungkeun/git/DCCE/output/dcce/ccweight/${bench}.ccw -- /home/sungkeun/git/DCCE/tests/bin/${bench}
done
