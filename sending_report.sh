rm .rubocop.yml

bundle exec rubocop -f json -o rubocop-report.json

curl --location 'https://codemetrics.dev/reports' \
--form 'report=@"./rubocop-report.json"' \
--form 'tool="rubocop"' \
--form 'token="SFMyNTY.g2gDYQduBgCX0w9migFiAAFRgA.w0a9y7VQGzfLkr2G1Cxxwm7m9uTcl99c24dh3zpKrl0"' \
--form 'branch="'"$GITHUB_HEAD_REF"'"'
