#!/bin/bash

git add .

echo "Enter commit name "
read nm
git commit -m "$nm"

git push origin main