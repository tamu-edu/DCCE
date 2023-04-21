

for numEntry in 10 100 200 400 800 1600
do
  for numCCID in 10 100 200 400 800 1600
  do
    ./pcce-profile ${numEntry} ${numCCID}
    ./dcce-profile ${numEntry} ${numCCID}
  done
done

for numEntry in 10 100 200 400 800 1600
do
  for numCCID in 10 100 200 400 800 1600
  do
    /usr/bin/time -v ./pcce-elider ${numEntry} ${numCCID} > output-pcce/${numEntry}-${numCCID}.txt 2>&1
    /usr/bin/time -v ./dcce-elider ${numEntry} ${numCCID} > output-dcce/${numEntry}-${numCCID}.txt 2>&1
  done
done
