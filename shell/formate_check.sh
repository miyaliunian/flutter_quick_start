#!/bin/bash
#format code
darfmt -w --fix lib/

#check code
dartanalyzer lib