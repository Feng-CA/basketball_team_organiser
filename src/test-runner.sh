#!/bin/bash
now=$(date +"%d-%m-%Y_%H-%M")
rspec --format documentation >> ./test-documentation/${now}-test.log