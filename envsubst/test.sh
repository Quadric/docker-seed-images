#!/bin/bash
tag=$(<tag)

expected_0='--name=ciro --surname='
actual_0=$(docker run -e "name=ciro" $tag '--name=${name} --surname=${surname}')

if [[ $actual_0 != $expected_0 ]]; then
  echo "expected (0) '$expected_0', got '$actual_0'"
  exit 1
fi


expected_1='--name=ciro --surname=${surname}'
actual_1=$(docker run -e "name=ciro" $tag '--name=${name} --surname=${surname}' '${name}')

if [[ $actual_1 != $expected_1 ]]; then
  echo "expected (1) '$expected_1', got '$actual_1'"
  exit 1
fi


expected_2='--name=ciro --surname=gomes'
actual_2=$(docker run -e "name=ciro" -e "surname=gomes" $tag '--name=${name} --surname=${surname}' '$name,$surname')

if [[ $actual_2 != $expected_2 ]]; then
  echo "expected (2) '$expected_2', got '$actual_2'"
  exit 2
fi

exit 0
