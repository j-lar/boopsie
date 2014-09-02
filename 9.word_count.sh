#!/bin/bash
echo "Occurrences of 'US-CA' in boopsie_test.tsv:"
cat /tmp/boopsie_challenge/boopsie_test.tsv| grep US-CA | wc -l 
