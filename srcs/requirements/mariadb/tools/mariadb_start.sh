#!/bin/bash

service mysql start
mysql -u root -e "CREATE DATABASE $DB_NAME;"